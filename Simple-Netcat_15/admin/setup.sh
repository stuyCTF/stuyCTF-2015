#!/bin/bash

RED="\033[1;31m"
RESET="\033[m"

PID=$$
PORT=11111
TYPE=tcpserver
if [[ ! -f ../../simple-netcat.pid ]]; then
    echo -e "${PID} ${PORT} ${TYPE}" > ../../simple-netcat.pid
    while true; do
        if tcpserver -H -R 0.0.0.0 $PORT echo "stuyctf{yay_for_netcat!}" 2>&1 | grep "unable to bind" > /dev/null; then
            printf "${RED}ERROR (Simple Netcat): Port ${PORT} already in use!${RESET}\n"
            exit 1
        fi
    done
else
    printf "${RED}Instance for Simple Netcat detected. Aborting startup.${RESET}\n"
fi
