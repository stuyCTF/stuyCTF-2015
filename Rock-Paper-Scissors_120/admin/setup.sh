#!/bin/bash

# Don't forget to add the problem to the start-nc-servers.sh and kill-nc-servers.sh scripts!
# Also, please check that your port is not yet allocated!
#     find . -name "setup.sh" -exec grep PORT= {} \;
# Lastly make sure that you place this in the admin/ folder of your problem!

RED="\033[1;31m"
RESET="\033[m"

PID=$$
PROBLEM_NAME="Rock Paper Scissors" # keep this formal
SCRIPT_TO_RUN="python server.py"
PORT=50000
PROBLEM_NAME_SLUG=${PROBLEM_NAME// /-}
TYPE=python
if [[ ! -f ../../$PROBLEM_NAME_SLUG.pid ]]; then
    echo -e "${PID} ${PORT} ${TYPE}" > ../../$PROBLEM_NAME_SLUG.pid
    while true; do
        if $SCRIPT_TO_RUN 2>&1 | grep "Address already in use" > /dev/null; then
            printf "${RED}ERROR ($PROBLEM_NAME): Port ${PORT} already in use!${RESET}\n"
            rm ../../$PROBLEM_NAME_SLUG.pid
            exit 1
        fi
    done
else
    printf "${RED}Instance for $PROBLEM_NAME detected. Aborting startup.${RESET}\n"
fi
