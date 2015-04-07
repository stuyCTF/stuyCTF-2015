#!/bin/bash

RED="\033[1;31m"
RESET="\033[m"

PID=$$
PORT=12348
TYPE=tcpserver
if [[ ! -f ../../tic-tac-toe.pid ]]; then
    echo -e "${PID} ${PORT} ${TYPE}" > ../../tic-tac-toe.pid
    while true; do
        if tcpserver 0.0.0.0 $PORT ./ttt 2>&1 | grep "unable to bind" > /dev/null; then
            printf "${RED}ERROR (Tic Tac Toe): Port ${PORT} already in use!${RESET}\n"
            exit 1
        fi
    done
else
    printf "${RED}Instance for Tic Tac Toe detected. Aborting startup.${RESET}\n"
fi
