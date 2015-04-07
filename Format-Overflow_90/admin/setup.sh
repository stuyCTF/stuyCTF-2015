#!/bin/bash

RED="\033[1;31m"
RESET="\033[m"

PID=$$
PORT=12346
TYPE=tcpserver
if [[ ! -f ../../format-overflow.pid ]]; then
    echo -e "${PID} ${PORT} ${TYPE}" > ../../format-overflow.pid
    while true; do
        if tcpserver 0.0.0.0 $PORT ./format-overflow 2>&1 | grep "unable to bind" > /dev/null; then
            printf "${RED}ERROR (Format Overflow): Port ${PORT} already in use!${RESET}\n"
            exit 1
        fi
    done
else
    printf "${RED}Instance for Format Overflow detected. Aborting startup.${RESET}\n"
fi
