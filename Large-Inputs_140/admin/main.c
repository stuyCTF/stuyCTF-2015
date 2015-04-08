#include <stdio.h>
#include <stdlib.h>

#define NUMBER_OF_RANDOMS 23
#define SECRET_INPUT 6981767462134

// Generates the floats that are later used
double * generator() {
    srand(NUMBER_OF_RANDOMS * 123456789);
    double *numbers = (double *) malloc(NUMBER_OF_RANDOMS * sizeof(double));
    int length = NUMBER_OF_RANDOMS-1;
    for (; length >= 0; length--) {
        numbers[length] = (double) rand() * 2;
    }
    printf("double numbers[] = {");
    int i;
    for (i=0; i<NUMBER_OF_RANDOMS-1; ++i) {
        printf("%.0f, ", numbers[i]);
    }
    printf("%.0f};\n", numbers[i]);
    return numbers;
}

long algorithm(long input, double *numbers, int length_numbers) {
    double result = input;
    int i;
    for (i=1; i<length_numbers; ++i) {
        result = (result / numbers[i] + numbers[i-1] / result);
    }
    return (long) result;
}

int main() {
    long input;
    /* Make sure to give them the result of the algorithm when released */
    double *numbers = generator();
    input = SECRET_INPUT;
    long computer = algorithm(input, numbers, NUMBER_OF_RANDOMS);
    printf("Give the players: %lu, The answer is %lu\n", computer, SECRET_INPUT);
    /* End hidden */
    printf("Hello!\n");
    printf("Guess a number and I will tell you whether it is correct or not!\n");
    printf("Guess here > ");
    fflush(stdout);
    scanf("%lu", &input);
    if (computer == algorithm(input, numbers, NUMBER_OF_RANDOMS)) {
        printf("Congrats! Your flag is stuyctf{%lu}\n", input);
    }
    else {
        printf("That's too bad!\n");
    }
    free(numbers);
    return 0;
}
