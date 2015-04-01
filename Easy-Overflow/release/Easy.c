#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

void giveShell() {
    gid_t gid = getgid();
    setresgid(gid, gid, gid);
    system("/bin/sh -i");
}

int main() {
    int secret = 0;
    char password[30];
    printf("Welcome, please enter your password: \n");
    scanf("%s", password);
    if (secret == 67) {
        giveShell();
        return 0;
    }
    else {
        printf("Nope...\n");
        return 1;
    }
}
