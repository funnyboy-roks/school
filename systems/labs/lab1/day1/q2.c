/*
* Name:                Hayden Pott
* Date:                27 Sept 2023
* Program Description: Convert minutes to hours
*/
#include <stdio.h>

#define MINUTES_IN_HOUR 60

int main() {
    int n;
    do {
        printf("Enter the number of minutes to convert: ");
        scanf("%d", &n);
        printf("%d minute%s = ", n, n == 1 ? "" : "s");
        int h = n / MINUTES_IN_HOUR;
        if (h) {
            printf("%d hour%s", h, h == 1 ? "" : "s");
        }
        int m = n % MINUTES_IN_HOUR;
        if (h && m) {
            printf(", ");
        }
        if (m) {
            printf("%d minute%s", m, m == 1 ? "" : "s");
        }
        printf("\n");
    } while (n > 0);
    return 0;
}
