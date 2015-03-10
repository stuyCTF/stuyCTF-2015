#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int argc, char *argv[]) {
    char flag[34] = <REDACTED>;
    char password[34];
    printf("I would tell you my secret, but I need to know the password!\n");
    fgets(password, sizeof(password), stdin);

    // DECRYPT FLAG
    <REDACTED>;

    if (strcmp(password, flag) == 0) {
        printf("Yay! Here's the flag: %s\n", flag);
    }
    else {
        printf("That's not the password!\n");
    }
    return 0;
}
