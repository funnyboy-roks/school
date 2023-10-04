/*
* Name: Hayden Pott
* Date: 04. Okt 2023
* Desc: cp
*/
#include <stdio.h>
#include <stdlib.h>
#include "checksum.h"

int main(int argc, char *argv[]) {

    // print usage
    if (argc <= 2) {
        printf("%s <src> <dest>\n", argv[0]);
        return 1;
    }

    FILE *s, *d;

    // Open for reading
    if ((s = fopen(argv[1], "rb")) == NULL) {
        printf("Error opening from file: no such file or directory (%s)\n", argv[1]);
        return 2;
    }

    // Open for writing and create the file if necessary
    d = fopen(argv[2], "wb+");

    // Copy bytes
    for(char c; (c = fgetc(s)) != EOF; fputc(c, d));

    // Close fds
    fclose(s);
    fclose(d);

    // Print info
    printf("Files copied successfully\n");
    printf("Checksum of %s: %s\n", argv[1], fileChecksum(argv[1]));
    printf("Checksum of %s: %s\n", argv[2], fileChecksum(argv[2]));

    return 0;
}
