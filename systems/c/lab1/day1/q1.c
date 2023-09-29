/*
* Name:                Hayden Pott
* Date:                27 Sept 2023
* Program Description: Print certain chars from the privided arguments
*/
#include <stdio.h>

int main(int argc, char* args[]) {
    printf("%c ", args[0][2]);
    for (int i = 1; i < argc; ++i)
        printf("%c ", args[i][i & 1]);
    printf("\n");

    return 0;
}
