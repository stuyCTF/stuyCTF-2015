#include <stdio.h>
#include <stdlib.h>

int main() {
    char *FLAG = "Flag: stuyctf{s0_much_format_string_l34k}";

    char name[64];
    printf("What is your name?\n");
    fflush(stdout);
    fgets(name, sizeof(name) * sizeof(short), stdin);

    printf("Hello ");
    fflush(stdout);
    printf(name);
    return 0;
}
