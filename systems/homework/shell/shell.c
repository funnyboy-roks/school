/**
 * Name: Hayden Pott
 * Date: 23. Okt 2023
 * Description: Not really that difficult, didn't really struggle with anything.
 * I quite enjoyed working on this. I think that I don't need the `find_exec`
 * fn, but I kind of just wanted to implement it.  I did impl a `cd` fn that
 * used an array as a stack and did dynamic resizing, but I still needed the
 * `chdir` fn to actually change the working dir for the bin.
 */

#include <dirent.h>
#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/stat.h>
#include <sys/wait.h>
#include <time.h>
#include <unistd.h>

#define DBG 1

#define dbg(...) if (DBG) { fprintf(stderr, "DBG: "); fprintf(stderr, __VA_ARGS__); fprintf(stderr, "\n"); }

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
    dbg("exec = %s", exec);
    int execlen = strlen(exec);
    char *PATH = getenv("PATH");
    // NOTE: Not using strtok here so that I don't have to copy PATH.
    int l;
    for (char *p = PATH, *e = strchr(p, ':'); e; e = strchr(p = e + 1, ':')) { // loop over ever elt in the $PATH
        // Create a string that is long enough: (len of path) + (len of bin) + '/'? + '\0'
        char *full_path = malloc((l = e - p) + execlen + (*(e - 1) != '/') + 1);

        // Copy the bin name into the full_path str (l = len of path element)
        strncpy(full_path, p, l);

        // add the '/' if the path elt does not have it
        if (*(e - 1) != '/') strcat(full_path, "/");

        // append the name of the bin
        strcat(full_path, exec);

        // at this point, full_path is something like `/usr/bin/cat`

        dbg("full_path = %s", full_path);

        // check if the path exists and is executable
        struct stat st;
        if (!stat(full_path, &st) && st.st_mode & S_IEXEC) {
            return full_path;
        }

    }

    // Could not find bin, so return NULL
    return NULL;
}

/**
 * Check if a path is absolute or relative (for a bin)
 *
 * Just whether it starts with "./" or '/'
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
    dbg("argc = %d", argc);

    if (!strcmp(argv[0], "cd")) { // cd <path>
        if (argc != 2) {
            fprintf(stderr, "cd\nUsage: cd <path>\n");
        } else {
            cd(argv[1]);
        }
        return 1;
    } else if (!strcmp(argv[0], "exit")) { // exit
        exit(0);
        return 1;
    }
    return 0;
}

char *format_time(unsigned int seconds) {
    int size = 32;
    char *out = malloc(size);
    int minutes = seconds / 60;
    seconds %= 60;
    int hours = minutes / 60;
    minutes %= 60;
    char *p = out;
    if (hours > 0) {
        p += sprintf(p, "%dh ", hours);
    }
    if (minutes > 0) {
        p += sprintf(p, "%dm ", minutes);
    }
    if (seconds > 0) {
        p += sprintf(p, "%ds ", seconds);
    }
    return out;
}


int main(int argc, char *argv[]) {
    size_t size = 255;

    char *line = malloc(size), *line2, *user_cmd;
    unsigned int last_exec_time;
    while (1) {
        dbg("%d", last_exec_time);
        // why not have a pretty prompt? (totally not the exact format of my own)
        printf("\033[0;34m%s \033[0;33m%s\033[0;35m❯ \033[0m", formatted_cwd(), last_exec_time < 5 ? "" : format_time(last_exec_time));
        int len = getline(&line, &size, stdin); // readline
        if (len == -1) break;

        line[--len] = '\0'; // remove trail newline

        for(;line[0] == ' '; ++line, --len); // Remove leading spaces
        for(;line[len] == ' '; line[len--] = '\0'); // Remove trailing spaces

        // Skip blank lines
        if (len == 0) continue;

        int argc = 1; // count the amount of args in the line
        for (int i = 0; i++ < len; line[i] == ' ' && ++argc);

        // create an array for these args (+1 for NULL terminator)
        char *args[argc + 1];

        // Create a new pointer to line that we can manipulate
        line2 = line;
        dbg("argc = %d", argc);

        char *dst_file = NULL;
        char *src_file = NULL;

        char next_dst = 0;
        char next_src = 0;
        int i = 0;
        // loop over each arg and
        for (char *t; t = strtok(line2, " "); line2 = NULL) {
            dbg("\t%s", t);

            if (!dst_file && next_dst) dst_file = t;
            if (!src_file && next_src) src_file = t;

            if (t[0] == '>') next_dst = 1;
            if (t[0] == '<') next_src = 1;

            if (!dst_file && !src_file) args[i++] = t;
        }

        if (dst_file || src_file) {
            argc = i - 1;
        }

        user_cmd = args[0];
        dbg("user_cmd = %s", user_cmd);

        // Try to handle built-ins
        if (handle_cmd(args, argc)) {
            continue;
        }

        // If it's not a relative path, then search for the executable
        if (!is_relative_or_absolute(args[0])) {
            // Change args[0] to be the properly qualified path
            args[0] = find_exec(user_cmd);
            dbg("exec = %s", args[0]);
        }

        dbg("args[0] = %s", args[0]);

        // If the args[0] is unknown, let the user know
        if (args[0] == NULL) {
            fprintf(stderr, "Unknown command: %s\n", user_cmd);
            continue;
        }

        // Set the final arg to NULL as execvp requires
        args[argc] = NULL;

        // now, exec the command
        int start = time(NULL);
        int pid = fork();
        if (pid == 0) {
            dbg("FORK: src_file = %s", src_file);
            FILE *src, *dst;
            if (src_file) { // open the src file if we're supposed to 
                src = fopen(src_file, "r");
                if (src == NULL) {
                    perror("Can't open file for reading");
                    return 1;
                }
                dbg("FORK: src = %p", src);
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
        last_exec_time = time(NULL) - start;
    }

    free(line);
    free(line2);

    return 0;
}
