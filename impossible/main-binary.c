#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int argc, char *argv[]) { char flag[34]={19,29,16,14,35,14,33,64,127,44,44,44,41,25,52,93,93,65,89,44,44,55,14,121,116,17,28,24,29,29,22,90,113,0}; char password[34]; printf("I would tell you my secret, but I need to know the password!\n"); fgets(password, sizeof(password), stdin); flag[sizeof(flag) - 1] = 0; int i; for (i = sizeof(flag) - 1; i > 0; --i) { flag[i-1] = (flag[i-1] ^ flag[i]) + 12; } if (strcmp(password, flag) == 0) { printf("Yay! Here's the flag: %s\n", flag); } else { printf("That's not the password!\n"); } return 0; }
