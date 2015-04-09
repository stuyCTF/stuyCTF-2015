#!/bin/bash

# Don't forget to add the problem to the start-nc-servers.sh and kill-nc-servers.sh scripts!
# Also, please check that your port is not yet allocated!
#     find . -name "setup.sh" -exec grep PORT= {} \;
# Lastly make sure that you place this in the admin/ folder of your problem!

RED="\033[1;31m"
RESET="\033[m"

PID=$$
PROBLEM_NAME="Tic Tac Toe" # keep this formal
SCRIPT_TO_RUN="./ttt"
PORT=12347
PROBLEM_NAME_SLUG=${PROBLEM_NAME// /-}
TYPE=tcpserver
_UID=$(id -u tic-tac-toe)
_GID=$(id -g tic-tac-toe)
if [[ $(id -u) != "0" ]]; then
    printf "${RED}(${PROBLEM_NAME}) This script must be run as root.${RESET}\n"
    exit 1
fi
if [[ $_UID == "" || $_GID == "" ]]; then
    printf "${RED}Missing user for ${PROBLEM_NAME}.${RESET}\n"
    exit 1
fi
if [[ ! -f ../../$PROBLEM_NAME_SLUG.pid ]]; then
    echo -e "${PID} ${PORT} ${TYPE}" > ../../$PROBLEM_NAME_SLUG.pid
    while true; do
        if sudo tcpserver -g $_GID -u $_UID -H -R 0.0.0.0 $PORT $SCRIPT_TO_RUN 2>&1 | grep "unable to bind" > /dev/null; then
            printf "${RED}ERROR ($PROBLEM_NAME): Port ${PORT} already in use!${RESET}\n"
            rm ../../$PROBLEM_NAME_SLUG.pid
            exit 1
        fi
    done
else
    printf "${RED}Instance for $PROBLEM_NAME detected. Aborting startup.${RESET}\n"
fi
