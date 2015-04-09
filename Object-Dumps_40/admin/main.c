#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int function(int arg, int args) {
    arg += 2;
    args -= arg;
    return func(arg, args);
}

int func(int many, int few) {
    int some;
    many++;
    for (many; many<few; many++) {
        if (many - few > 10) {
            some = 2;
            some *= many * few;
            break;
        }
    }
    return some + many + few;
}

int main() {
    char *message = "I really don't know what I'm doing";
    char buffer[256];
    strcpy(buffer, message);
    strcat(buffer, ". Yup this is what we do for stuyCTF");
    int numberone = buffer[1];
    int numbertwo = buffer[2];
    if (numberone > numbertwo) {
        numberone++;
    }
    else {
        numbertwo++;
    }
    int result = function(numberone, numbertwo);
    int maybe = func(numbertwo, numberone);
    int end = function(result, maybe);
    printf("Yay %d!\n", end);
}
