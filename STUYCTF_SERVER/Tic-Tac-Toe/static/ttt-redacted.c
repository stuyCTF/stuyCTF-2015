#include<stdlib.h>
#include<stdio.h>

char *flag = "XXXXXXXXXXXXXXCONNECT_TO_THE_SERVERXXXXXXXXXXXXXX";
char player = 'O';
char comp = 'X';
char board[9];
int winningConds[8][3] = {
    {0, 1, 2},
    {3, 4, 5},
    {6, 7, 8},
    {0, 3, 6},
    {1, 4, 7},
    {2, 5, 8},
    {0, 4, 8},
    {2, 4, 6}
};

void draw(char b[9]) {
    printf("-------------\n");
    printf("| %c | %c | %c |\n", b[0], b[1], b[2]);
    printf("|---+---+---|\n");
    printf("| %c | %c | %c |\n", b[3], b[4], b[5]);
    printf("|---+---+---|\n");
    printf("| %c | %c | %c |\n", b[6], b[7], b[8]);
    printf("-------------\n");
}


void clean_stdin() {
    int c;
    do {
        c = getchar();
    } while (c != '\n' && c != EOF);
}

int spaceLeft(char b[9]) {
    int filled = 0;
    int i;
    for (i = 0 ; i < 9 ; i++) {
        if (b[i] == ' ')
            filled++;
    }

    return filled;
}

char checkWin(char b[9], int win[8][3]) {
    int i;
    for (i = 0 ; i < 8 ; i++) {
        if (b[win[i][0]] != ' ' &&
            b[win[i][0]] == b[win[i][1]] &&
            b[win[i][0]] == b[win[i][2]])
                return b[win[i][0]];
    }

    return ' ';
}

void resetBoard(char b[9]) {
    int i;
    for (i = 0 ; i < 9 ; i++) {
        b[i] = ' ';
    }
}

void playerMove(char b[9]) {
    int move = -1;
    int ret = 0;
    do {
        printf("\nYour move? (pick a vacant spot numbered 0-8) ");
        ret = scanf("%d", &move);
        if (ret == -1) {
            // EOF reached
            printf("[Reached EOF]\n");
            printf("Quitting....\n");
            exit(0);
        }
        clean_stdin();
        printf("\n");
    }
    while (move < 0 || move > 8 || b[move] != ' ');

    b[move] = player;
}

void compMove(char b[9]) {
    int i;
    for (i = 0 ; i < 9 ; i++) {
        if (b[i] == ' ') {
            b[i] = player;
            if (checkWin(b, winningConds) == player) {
                b[i] = comp; // Need to patch one-way-win's first.
                return;
            }
            else {
                b[i] = ' ';
            }
        }
    }

    // Patch for the very critical condition

    int corners[] = {0, 2, 6, 8};

    if (b[4] == ' ') {
        b[4] = comp;
        return;
    }

    if (b[4] == player) {
        for (i = 0 ; i < 4 ; i++) {
            if (b[corners[i]] == ' ') {
                b[corners[i]] = comp;
                return;
            }
        }
    }
    

    // No critical conditions...
    // YOLO!
    int moveYolo = 4;

    while (b[moveYolo] != ' ') {
        moveYolo = rand() % 9;
    }

    b[moveYolo] = comp;
    return;
}

int game(int s, char b[9]) {
    while (checkWin(b, winningConds) == ' ') {
        printf("Your current score: %d\n", s);
        draw(b);
        playerMove(b);
        if ((spaceLeft(b))) {
            compMove(b);
        }
        else {
            break;
        }
        printf("\033\143\n");
    }

    draw(b);

    if (checkWin(b, winningConds) == player)
        s = s + 1;
    if (checkWin(b, winningConds) == comp)
        s = s - 1;

    return s;
}

int main(int argc, char **argv) {
    setbuf(stdout, NULL);
    int score = 0;
    char name[1337];

    printf("Hello! Welcome to this game of tic-tac-toe, what is your name? ");
    scanf("%s", name);

    printf("Welcome! %s\n", name);
    printf("Can you score 15 points on the computer?\n");

    while (score > -15 && score < 15) {
        resetBoard(board);
        score = game(score, board);
    }

    if (score == 15) {
        printf("INCONCEIVABLE!!!\nHere's your flag: %s\n", flag);
    }

    else {
        printf("You lost! Better luck next time!\n");
    }
}

