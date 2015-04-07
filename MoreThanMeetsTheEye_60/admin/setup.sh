#!/bin/bash

RED="\033[1;31m"
RESET="\033[m"

PID=$$
PORT=49998
TYPE=tcpserver
if [[ ! -f ../../more-than-meets-the-eye.pid ]]; then
    echo -e "${PID} ${PORT} ${TYPE}" > ../../more-than-meets-the-eye.pid
    while true; do
        if tcpserver 0.0.0.0 $PORT ./yoloswag.py 2>&1 | grep "unable to bind" > /dev/null; then
            printf "${RED}ERROR (MoreThanMeetsTheEye): Port ${PORT} already in use!${RESET}\n"
            exit 1
        fi
    done
else
    printf "${RED}Instance for MoreThanMeetsTheEye detected. Aborting startup.${RESET}\n"
fi
