#include <stddef.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main() {
    size_t size = 100;
    const char delim = ' ';

    while (1) {
        char *s = malloc(size);
        printf("$ ");
        getline(&s, &size, stdin); // readline
        s[strlen(s) - 1] = '\0'; // replace trail newline
        printf("Line Read: %s\n", s);

        if (!strcmp(s, "exit")) break; // check for exit

        printf("Token(s):\n");
        int o = 0;
        for (char *v, *t; t = strtok_r(s, &delim, &v); printf("\t%s\n", t, s = NULL, ++o)); // print tokens
        printf("%d token(s) read.\n\n", o); // print count
    }
}
