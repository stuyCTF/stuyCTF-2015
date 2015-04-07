#!/bin/bash

RED="\033[1;31m"
RESET="\033[m"

PID=$$
PORT=12345
TYPE=tcpserver
if [[ ! -f ../../easy-overflow.pid ]]; then
    echo -e "${PID} ${PORT} ${TYPE}" > ../../easy-overflow.pid
    while true; do
        if tcpserver -H -R 0.0.0.0 $PORT ./easy-overflow 2>&1 | grep "unable to bind" > /dev/null; then
            printf "${RED}ERROR (Easy Overflow): Port ${PORT} already in use!${RESET}\n"
            exit 1
        fi
    done
else
    printf "${RED}Instance for Easy Overflow detected. Aborting startup.${RESET}\n"
fi
