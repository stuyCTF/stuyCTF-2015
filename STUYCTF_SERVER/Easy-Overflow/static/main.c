#include <stdio.h>
#include <stdlib.h>
#include <string.h>

char *flag = "stuyctf{that_was_easy}";

void giveFlag() {
    printf("%s\n", flag);
}

int main() {
    int secret = 0;
    char password[30];
    printf("Welcome, please enter your password: \n");
    scanf("%s", password);
    if (secret == 67) {
        giveFlag();
        return 0;
    }
    else {
        printf("Nope...\n");
        return 1;
    }
}
