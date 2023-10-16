/*
* Name:                Hayden Pott
* Date:                27 Sept 2023
* Program Description: Print the binary repr of a given number
*/
#include <stdio.h>

int main() {
    int n; 
    do {
        printf("Enter an Integer (-1 to quit): ");
        scanf("%d", &n);
        printf("Binary Equivalent: %b\n", n);
    } while (n >= 0);
    printf("Bye\n");
    return 0;
}
