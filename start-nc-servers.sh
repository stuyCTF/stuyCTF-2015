#!/bin/bash

GREEN="\033[1;32m"
YELLOW="\033[1;33m"
RESET="\033[m"
if [[ -x /usr/bin/tcpserver ]]; then
    printf "${YELLOW}tcpserver is all set up!${RESET}\n"
else
    printf "${YELLOW}Installing ucspi-tcp....${RESET}\n"
    sudo apt-get install ucspi-tcp
fi
printf "${GREEN}Running servers....${RESET}\n"

printf "${GREEN}Deploying Simple-Netcat....${RESET}\n"
bash -c "cd Simple-Netcat_15/admin/ && ./setup.sh" &
printf "${GREEN}Deploying Easy-Overflow....${RESET}\n"
bash -c "cd Easy-Overflow_60/admin/ && ./setup.sh" &
printf "${GREEN}Deploying MoreThanMeetsTheEye....${RESET}\n"
bash -c "cd More-Than-Meets-The-Eye_60/admin/ && ./setup.sh" &
printf "${GREEN}Deploying Tic-Tac-Toe....${RESET}\n"
bash -c "cd Tic-Tac-Toe_75/admin/ && ./setup.sh" &
printf "${GREEN}Deploying Login-Attempts....${RESET}\n"
bash -c "cd Login-Attempts_80/admin/ && ./setup.sh" &
printf "${GREEN}Deploying Format-Overflow....${RESET}\n"
bash -c "cd Format-Overflow_90/admin/ && ./setup.sh" &
printf "${GREEN}Deploying Rock-Paper-Scissors....${RESET}\n"
bash -c "cd Rock-Paper-Scissors_150/admin/ && ./setup.sh" &
