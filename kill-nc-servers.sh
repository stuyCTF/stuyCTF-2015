#!/bin/bash

RED="\033[1;31m"
GREEN="\033[1;32m"
YELLOW="\033[1;33m"
RESET="\033[m"
function close_port() {
    pid=$(netstat -lpn 2> /dev/null | grep "0.0.0.0:$1" | grep -o "[0-9]*/$2" | cut -d '/' -f 1)
    if [[ $pid != "" ]]; then
        printf "${YELLOW}Closing port $1.... (${pid}/$2)${RESET}\n"
        kill -9 $pid
    fi
}

function get_pid() {
    echo $1
}

function get_port() {
    echo $2
}

function get_type() {
    echo $3
}

if [[ -f easy-overflow.pid ]]; then
    read line < easy-overflow.pid
    pid=$(get_pid $line)
    port=$(get_port $line)
    type=$(get_type $line)
    printf "${GREEN}Killing process for Easy Overflow (${pid}/${type})${RESET}\n"
    kill -9 $pid && rm easy-overflow.pid
    close_port $port $type
fi
if [[ -f more-than-meets-the-eye.pid ]]; then
    read line < more-than-meets-the-eye.pid
    pid=$(get_pid $line)
    port=$(get_port $line)
    type=$(get_type $line)
    printf "${GREEN}Killing process for MoreThanMeetsTheEye (${pid}/${type})${RESET}\n"
    kill -9 $pid && rm more-than-meets-the-eye.pid
    close_port $port $type
fi
if [[ -f format-overflow.pid ]]; then
    read line < format-overflow.pid
    pid=$(get_pid $line)
    port=$(get_port $line)
    type=$(get_type $line)
    printf "${GREEN}Killing process for Format Overflow (${pid}/${type})${RESET}\n"
    kill -9 $pid && rm format-overflow.pid
    close_port $port $type
fi
if [[ -f login-attempts.pid ]]; then
    read line < login-attempts.pid
    pid=$(get_pid $line)
    port=$(get_port $line)
    type=$(get_type $line)
    printf "${GREEN}Killing process for Login Attempts (${pid}/${type})${RESET}\n"
    kill -9 $pid && rm login-attempts.pid
    close_port $port $type
fi
if [[ -f rock-paper-scissors.pid ]]; then
    read line < rock-paper-scissors.pid
    pid=$(get_pid $line)
    port=$(get_port $line)
    type=$(get_type $line)
    printf "${GREEN}Killing process for Rock Paper Scissors (${pid}/${type})${RESET}\n"
    kill -9 $pid && rm rock-paper-scissors.pid
    close_port $port $type
fi
