#!/bin/bash

RED="\033[1;31m"
RESET="\033[m"

PID=$$
PORT=50000
TYPE=python
if [[ ! -f ../../rock-paper-scissors.pid ]]; then
    echo -e "${PID} ${PORT} ${TYPE}" > ../../rock-paper-scissors.pid
    while true; do
        if python server.py 2>&1 | grep "Address already in use" > /dev/null; then
            printf "${RED}ERROR (Rock Paper Scissors): Port ${PORT} already in use!${RESET}\n"
            exit 1
        fi
    done
else
    printf "${RED}Instance for Rock Paper Scissors detected. Aborting startup.${RESET}\n"
fi
