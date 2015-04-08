#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#define NUMBER_OF_RANDOMS 23

double numbers[] = {3570793128, 1458104314, 3260858022, 1345134392, 749597442, 289067508, 2759917644, 181602112, 1449980724, 1535408668, 988033496, 1457695096, 1802710596, 2496283884, 34647282, 2272064548, 3969791992, 2236522198, 2371091990, 3947054260, 338067104, 4274799248, 101450696};

long algorithm(long input, double *numbers, int length_numbers) {
    double result = input;
    int i;
    for (i=1; i<length_numbers; ++i) {
        result = (result / numbers[i] + numbers[i-1] / result);
    }
    return (long) result;
}

double * find_roots(double a, double b, double c) {
    double *roots = (double *) malloc(2 * sizeof(double));
    roots[0] = (-b + sqrt(b*b - 4*a*c)) / (2*a);
    roots[1] = (-b - sqrt(b*b - 4*a*c)) / (2*a);
    return roots;
}

double answers[1000];
int answers_index = 0;

void bash(int index, double result, double *numbers) {
    if (index >= 1) {
        double a = 1;
        double b = -(numbers[index] * result);
        double c = numbers[index] * numbers[index-1];
        double *roots = find_roots(a, b, c);
        bash(index-1, roots[0], numbers);
        bash(index-1, roots[1], numbers);
        free(roots);
    }
    else {
        if (result != 0 && !isnan(result) && !isinf(result)) {
            answers[answers_index] = result;
            answers_index++;
        }
    }
}

int main() {
    long input;
    long computer = 5362426;

    /* Bashing algorithm starts here */
    bash(NUMBER_OF_RANDOMS-1, computer, numbers);
    int i;
    for (i=0; i<sizeof(answers)/sizeof(double); i++) {
        if (answers[i] != 0) {
            printf("[ANSWER %3i] %.0f\n", i, answers[i]);
        }
    }

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
    return 0;
}
