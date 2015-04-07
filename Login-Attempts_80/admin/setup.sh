#!/bin/bash

RED="\033[1;31m"
RESET="\033[m"

PID=$$
PORT=49999
TYPE=tcpserver
if [[ ! -f ../../login-attempts.pid ]]; then
    echo -e "${PID} ${PORT} ${TYPE}" > ../../login-attempts.pid
    while true; do
        if tcpserver -H -R 0.0.0.0 $PORT ./login.py 2>&1 | grep "unable to bind" > /dev/null; then
            printf "${RED}ERROR (Login Attempts): Port ${PORT} already in use!${RESET}\n"
            exit 1
        fi
    done
else
    printf "${RED}Instance for Login Attempts detected. Aborting startup.${RESET}\n"
fi
