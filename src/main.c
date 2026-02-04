#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int argc, char *argv[]) {
    if (argc > 2) {
        printf("ERROR: %s takes two arguments: %s <integer>\n", argv[0], argv[0]);
        return 1;
    }
    if (argc == 1) {
        printf("%s version 1.0.1\nConverts integer to a Roman numeral\nTry %s --help for more info\n", argv[0], argv[0]);
        return 0;
    }
    if (strcmp(argv[1], "--help") == 0) {
        printf("Usage: %s <integer>\n", argv[0]);
        return 0;
    }
    if (strcmp(argv[1], "--version") == 0) {
        printf("%s version 1.0.1\n", argv[0]);
        return 0;
    }
    char *symbols[13] = {"I", "IV", "V", "IX", "X", "XL", "L", "XC", "C", "CD", "D", "CM", "M"};
    int values[13] = {1, 4, 5, 9, 10, 40, 50, 90, 100, 400, 500, 900, 1000};
    char *endptr;
    int input = strtol(argv[1], &endptr, 10);
    if (*endptr != '\0') {
        printf("ERROR: Invalid number\n");
        return 1;
    }
    if (input <= 0 || input > 3999) {
        printf("ERROR: Number must be between 1 and 3999\n");
        return 1;
    }
    char *result = malloc(64);
    result[0] = '\0';
    for (int i = 12; i >= 0; i--) {
        while (input >= values[i]) {
            strcat(result, symbols[i]);
            input -= values[i];
        }
    }
    printf("%s\n", result);
    free(result);
    return 0;
}