/*
* Name: Hayden Pott 
* Date: Today
* Desc: Convert between permissions and their utf-8 equivalent
*/
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int argc, char *argv[]) {
    for (char i, l, u, c, z, *s; (l = getline(&s, &z, stdin)) != -1; printf("%c", (char) strtol(s + 3, NULL, 2)))
        for (i = --l; i-- > 3; s[i] = s[i] == '-' ? '0' : '1');
}
