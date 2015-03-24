#include<stdio.h>
#include<stdlib.h>
#include<string.h>

int main() {
    char flag[32];
    char guess[32];
    flag[2] = 'u';
    flag[11] = 'd';
    flag[28] = 'n';
    flag[1] = 't';
    flag[4] = 'c';
    flag[16] = 'i';
    flag[5] = 't';
    flag[15] = '_';
    flag[17] = 's';
    flag[12] = 'u';
    flag[29] = 'd';
    flag[0] = 's';
    flag[20] = 'o';
    flag[21] = 'u';
    flag[22] = 'r';
    flag[27] = 'e';
    flag[26] = 'i';
    flag[8] = 'o';
    flag[3] = 'y';
    flag[9] = 'b';
    flag[10] = 'j';
    flag[7] = '{';
    flag[13] = 'm';
    flag[14] = 'p';
    flag[19] = 'y';
    flag[6] = 'f';
    flag[23] = '_';
    flag[24] = 'f';
    flag[18] = '_';
    flag[25] = 'r';
    flag[30] = '}';
    flag[31] = '\0';

    printf("Please enter your guess for the flag:\n");
    scanf("%31s", guess); // No overflow :P
    guess[sizeof(guess) - 1] = '\0';

    if (strcmp(guess, flag) == 0) {
        printf("WOW you guessed it! Here's the flag...\n%s\n", flag);
        return 0;
    }
    else {
        printf("Nope...\n");
        return 1;
    }
}
