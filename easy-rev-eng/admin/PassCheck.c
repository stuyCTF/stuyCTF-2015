#include<stdio.h>
#include<stdlib.h>
#include<string.h>

int main() {
    char flag[28];
    char guess[28];
    flag[18] = 'r';
    flag[14] = '_';
    flag[25] = 'd';
    flag[22] = 'i';
    flag[6] = 'f';
    flag[16] = 'o';
    flag[10] = 'b';
    flag[5] = 't';
    flag[19] = '_';
    flag[8] = 'g';
    flag[9] = 'd';
    flag[17] = 'u';
    flag[15] = 'y';
    flag[4] = 'c';
    flag[12] = 'i';
    flag[3] = 'y';
    flag[23] = 'e';
    flag[1] = 't';
    flag[20] = 'f';
    flag[0] = 's';
    flag[26] = '}';
    flag[24] = 'n';
    flag[13] = 's';
    flag[11] = '_';
    flag[21] = 'r';
    flag[2] = 'u';
    flag[7] = '{';
    flag[27] = '\x00';

    printf("Please enter your guess for the flag:\n");
    scanf("%27s", guess); // No overflow :P

    if (strcmp(guess, flag) == 0) {
        printf("WOW you guessed it! Here's the flag...\n%s\n", flag);
        return 0;
    }
    else {
        printf("Nope...\n");
        return 1;
    }
}
