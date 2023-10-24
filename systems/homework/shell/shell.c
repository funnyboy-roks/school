/**
 * Name: Hayden Pott
 * Date: 23 Okt 2023
 * Description: **Include what you were and were not able to handle!**
 *
 *
 */

#include <dirent.h>
#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/stat.h>
#include <sys/wait.h>
#include <unistd.h>

#define DBG 1

#define dbg(a) if (DBG) { printf("DBG: "); printf(a); printf("\n"); }

/**
 * Get CWD with s/$HOME/~
 */
char *formatted_cwd() {
    char *cwd = getcwd(NULL, 2048);

    char *home = getenv("HOME");
    int l;
    if (!strncmp(cwd, home, l = strlen(home))) { // If the path starts with $HOME,
        // remove the first len($HOME) - 1 chars
        cwd += l - 1;
        // and change the first char to '~'
        cwd[0] = '~';
    }

    return cwd;
}

/**
 * Return 0 upon success, and -1 upon error
 *
 * error messages are printing into the console, so there is no need to handle them independently.
 */
int cd(char *path) {
    int l;
    if ((l = strlen(path)) == 0) return 1;

    // If the path starts with ~ or ~/, cd to the home first
    if (path[0] == '~' && (l == 1 || l >= 2 && path[1] == '/')) {
        if (chdir(getenv("HOME"))) perror("Changing directory");
        path += (l != 1) + 1; // skip past '~/'
    }

    // Change dir if the path is not empty
    if (strlen(path) > 0 && chdir(path)) {
        perror("Changing directory");
        return -1;
    }
    return 0;
}

/**
 * search $PATH for an executable and return the full path when it is found
 */
char *find_exec(char *exec) {
    if (DBG) printf("DBG: exec = %s\n", exec);
    int execlen = strlen(exec);
    char *PATH = getenv("PATH");
    // TODO: use my own version of strok such that I don't need copy this string
    char *path = strdup(PATH);
    for (char *t; t = strtok(path, ":"); path = NULL) { // loop over ever elt in the $PATH
        if (DBG) printf("DBG: \tpath elt = %s\n", t);

        int tlen = strlen(t);
        // Create a string that is long enough: (len of path) + (len of bin) + '/'? + '\0'
        char *full_path = malloc(tlen + execlen + 1 + (t[tlen - 1] != '/'));

        strcat(full_path, t);
        if (full_path[tlen - 1] != '/') strcat(full_path, "/");
        strcat(full_path, exec);

        // at this point, full_path is something like `/usr/bin/cat`

        struct stat st;
        if (DBG) printf("DBG: full_path = %s\n", full_path);

        // check if the path exists and is executable
        if (!stat(full_path, &st) && st.st_mode & S_IEXEC) {
            return full_path;
        }

    }

    // Could not find bin, so return NULL
    return NULL;
}

/**
 * Check if a path is absolute or relative (for a bin)
 */
char is_relative_or_absolute(char *path) {
    int len = strlen(path);
    if (len == 0) return 0;
    switch(path[0]) {
        case '.': 
            return len >= 3 && path[1] == '/';
        case '/':
            return 1;
    }
    return 0;
}

/**
 * Check and run intepreter built-ins if they exist
 * returns 1 if the command existed and was handled, 0 if it did not exist.
 */
int handle_cmd(char** argv, int argc) {
    if (DBG) printf("DBG: argc = %d\n", argc);

    if (!strcmp(argv[0], "cd")) { // cd <path>
        if (argc != 2) {
            fprintf(stderr, "cd\nUsage: cd <path>\n");
        } else {
            cd(argv[1]);
        }
        return 1;
    }
    return 0;
}

int main(int argc, char *argv[]) {
    size_t size = 255;

    char *line = malloc(size), *line2, *user_cmd;
    while (1) {
        // why not have a pretty prompt?
        printf("\033[0;34m%s \033[0;35m❯ \033[0m", formatted_cwd());
        int len = getline(&line, &size, stdin); // readline
        if (len == -1) break;

        line[--len] = '\0'; // remove trail newline

        for(;line[0] == ' '; ++line, --len); // Remove leading spaces
        for(;line[len] == ' '; line[len] = '\0'); // Remove trailing spaces

        // Skip blank lines
        if (len == 0) continue;

        int argc = 1; // count the amount of args in the line
        for (int i = 0; i++ < len; line[i] == ' ' && ++argc);

        // create an array for these args (+1 for NULL terminator)
        char *args[argc + 1];

        // Create a new pointer to line that we can manipulate
        line2 = line;
        if (DBG) printf("DBG: argc = %d\n", argc);

        char *dst_file = NULL;
        char *src_file = NULL;

        char next_dst = 0;
        char next_src = 0;
        int i = 0;
        // loop over each arg and
        for (char *t; t = strtok(line2, " "); line2 = NULL) {
            if (DBG) printf("DBG: \t%s\n", t);

            if (!dst_file && next_dst) dst_file = t;
            if (!src_file && next_src) src_file = t;

            if (t[0] == '>') next_dst = 1;
            if (t[0] == '<') next_src = 1;

            if (!dst_file && !src_file) args[i++] = strdup(t);
        }

        if (dst_file || src_file) {
            argc = i - 1;
        }

        user_cmd = args[0];
        if (DBG) printf("DBG: user_cmd = %s\n", user_cmd);

        // Try to handle built-ins
        if (handle_cmd(args, argc)) {
            continue;
        }

        // If it's not a relative path, then search for the executable
        if (!is_relative_or_absolute(args[0])) {
            // Change args[0] to be the properly qualified path
            args[0] = find_exec(user_cmd);
            if (DBG) printf("DBG: exec = %s\n", args[0]);
        }

        if (DBG) printf("DBG: args[0] = %s\n", args[0]);

        // If the args[0] is unknown, let the user know
        if (args[0] == NULL) {
            fprintf(stderr, "Unknown command: %s\n", user_cmd);
            continue;
        }

        // Set the final arg to NULL as execvp requires
        args[argc] = NULL;

        // now, exec the command
        int pid = fork();
        if (pid == 0) {
            if (DBG) printf("DBG: FORK: src_file = %s\n", src_file);
            FILE *src, *dst;
            if (src_file) { // open the src file if we're supposed to 
                src = fopen(src_file, "r");
                if (src == NULL) {
                    perror("Can't open file for reading");
                    return 1;
                }
                if (DBG) printf("DBG: FORK: src = %p\n", src);
                dup2(fileno(src), 0);
            }
            if (dst_file) { // open the dst file if we're supposed to 
                dst = fopen(dst_file, "w");
                if (dst == NULL) {
                    perror("Can't open file for writing");
                    return 1;
                }
                dup2(fileno(dst), 1);
            }
            execvp(args[0], args);

            // we're very responsible
            fclose(src);
            fclose(dst);
            return 0;
        } else if (pid == -1) { // give error if necessary
            perror("Executing command");
            continue;
        }
        wait(NULL);
    }

    free(line);
    free(line2);

    return 0;
}
