/*
* Name(s): Imanol Sierra, Hayden Pott
* Date: today
* Desc: stuff and things
*/
#include <stdio.h>
#include <stdlib.h>

// a function that returns the length of a string
int b_strlen(const char *str) {
    int i = 0;
    for(char *p = str; *p++; ++i);
    return i;
}

// a function that concatenates two strings
char* b_strcat(char *dest, const char *src) {
    int i, dest_len = b_strlen(dest);

    if (dest == NULL) {
        return "";
    }

    for(i = 0; src[i]; i++) dest[dest_len + i] = src[i];
    dest[dest_len + i + 1] = '\0';

    return dest;
}

// a function that copies one string to another
char* b_strcpy(char *dest, const char *src) {
    int len = b_strlen(src);
    if (dest == NULL) {
        dest = malloc(len + 1);
    }
    for(int i = len + 1; i-- > 0; *(dest + i) = src[i]);
    return dest;
}

// a function that compares two strings and returns 
// an integer indicating the result
// 0 should be the truth case
// any other value should be considered false
int b_strcmp(const char *str1, const char *str2) {
    if (*str1 != *str2) return 1;
    for (int i = 0; str1[i] != '\0' && str2[i] != '\0'; ++i) {
        if (str1[i] != str2[i]) return 1;
    }
    return 0; // should return true (0) else false (any other value)
}

// a function that extracts a substring from a given 
// string and stores it in another string
// dest = place to set
// src = current string,
// start = starting position in string
// n = amount (i.e., length of substring)
char* b_substring(char *dest, const char *src, int start, int n) {
    int l;
    if ((l = b_strlen(src)) > start) return "";
    if (l < start + n) return "";

    src += start;

    if (dest == NULL) {
        dest = malloc(n + 1);
    }
    for(int i = n; i-- > 0; *(dest + i) = src[i]);

    return dest;
}

// @@@@@@@@@@@@@ DO NOT EDIT ANYTHING BELOW THIS POINT @@@@@@@@@@@@@
int main() {
    char str1[100], str2[100], str3[100];
    int result;

    printf("################# Test Case 1 START #################\n");
    printf("Length of \"This is an easy lab!\": %d\n", b_strlen("This is an easy lab!"));
    printf("################# Test Case 1 END #################\n\n");

    printf("################# Test Case 2 START #################\n");
    b_strcpy(str1, "Hello, ");
    printf("Concatenating \"Hello, \" and \"World!\": %s\n", b_strcat(str1, "World!"));
    printf("################# Test Case 2 END #################\n\n");

    printf("################# Test Case 3 START #################\n");
    b_strcpy(str2, "Sample String");
    printf("Copied String: %s to variable str2\n", str2);
    printf("################# Test Case 3 END #################\n\n");

    printf("################# Test Case 4 START #################\n");
    result = b_strcmp("Hello", "Hello");
    printf("Does \"Hello\" == \"Hello\"? %s\n", (result == 0 ? "Yes": "No"));
    result = b_strcmp("Hello", "World");
    printf("Does \"Hello\" == \"World\"? %s\n", (result == 0 ? "Yes": "No"));
    printf("################# Test Case 4 END #################\n\n");

    printf("################# Test Case 5 START #################\n");
    b_substring(str3, "Hello, World!", 7, 5);
    printf("Grabbing a substring of size 5 starting at position 7 of \"Hello, World!\": %s\n", str3);
    printf("################# Test Case 5 END #################\n\n");

    printf("################# Test Case 6 START #################\n");
    printf("Length of \"\": %d\n", b_strlen(""));
    printf("################# Test Case 6 END #################\n\n");

    printf("################# Test Case 7 START #################\n");
    b_strcpy(str1, "");
    printf("Concatenated \"World!\" with empty src: %s\n", b_strcat(str1, "World!"));
    b_strcpy(str1, "Hello, ");
    printf("Concatenated \"Hello, \" with empty dest: %s\n", b_strcat(str1, ""));
    printf("################# Test Case 7 END #################\n\n");

    printf("################# Test Case 8 START #################\n");
    b_strcpy(str2, "");
    printf("Copied empty String: \"%s\"\n", str2);
    printf("################# Test Case 8 END #################\n\n");

    printf("################# Test Case 9 START #################\n");
    result = b_strcmp("", "");
    printf("Does \"\" == \"\"? %s\n", (result == 0 ? "Yes": "No"));
    result = b_strcmp("Hello", "");
    printf("Does \"Hello\" == \"\"? %s\n", (result == 0 ? "Yes": "No"));
    printf("################# Test Case 9 END #################\n\n");

    printf("################# Test Case 10 START #################\n");
    b_substring(str3, "Hello, World!", 7, 0);
    printf("Grabbing a substring of size 0 starting at position 7 of \"Hello, World!\": \"%s\"\n", str3);
    b_substring(str3, "Hello, World!", 20, 5);
    printf("Grabbing a substring of size 5 starting at position 20 of \"Hello, World!\" (out-of-bounds): \"%s\"\n", str3);
    printf("################# Test Case 10 END #################\n\n");

    return 0;
}

