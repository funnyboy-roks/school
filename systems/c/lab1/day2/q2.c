/**
 * Name: Hayden Pott
 * Date: 29 Sept 2023
 * Desc: Fork a process
 */

#include <stdio.h>
#include <unistd.h>

int main(int argc, char *args[]) {
    if (argc == 1) {
        printf("Usage: %s <executable>\n", args[0]);
        return 1;
    }

    int child_pid = fork();
    if (child_pid != 0) {
        char *a[0];
        execvp(args[1], (char * const*) *a);
    }
    return 0;
}
