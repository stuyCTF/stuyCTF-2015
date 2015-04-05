#include <stdio.h>
#include <stdlib.h>
#include <string.h>

char *flag = "stuyctf{0V3rfl0w_format_string_l34k}";

void give_flag(int flag_length, char *flag_to_give, char *message) {
    printf("Welcome to stuyCTF! Here is your flag: \n"); // Why does this not work??
    printf("It should be %d characters long.\n", flag_length);
    printf(message);
}

int main() {
    char message[96] = "Haha you'll never figure out the flag! :P\n";
    char name[32];
    bzero(name, 32);

    printf("What is your name?\n");
    fgets(name, sizeof(name) + sizeof(message), stdin); // I account for the size of the message and name arrays, so I should be safe right?

    printf("Hello %s\n", name);
    give_flag(strlen(flag), flag, message);

    fflush(stdout);
    return 0;
}