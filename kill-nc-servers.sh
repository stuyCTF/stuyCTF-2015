#!/bin/bash

RED="\033[1;31m"
GREEN="\033[1;32m"
YELLOW="\033[1;33m"
RESET="\033[m"

function get_pid() {
    echo $1
}

function get_port() {
    echo $2
}

function get_type() {
    echo $3
}

function close_port() {
    pid=$(netstat -lpn 2> /dev/null | grep "0.0.0.0:$1" | grep -o "[0-9]*/$2" | cut -d '/' -f 1)
    if [[ $pid != "" ]]; then
        printf "${YELLOW}Closing port $1.... (${pid}/$2)${RESET}\n"
        kill -9 $pid
    fi
}

function kill_problem() {
    pid_file=$1
    problem_name=$2
    if [[ -f $pid_file ]]; then
        read line < $pid_file
        pid=$(get_pid $line)
        port=$(get_port $line)
        type=$(get_type $line)
        printf "${GREEN}Killing process for ${problem_name} (${pid}/${type})${RESET}\n"
        kill -9 $pid && rm $pid_file
        close_port $port $type
    fi
}

for pid_file in `ls *.pid`
do
    problem_name=$(basename $pid_file .pid)
    kill_problem $pid_file "${problem_name//-/ }"
done
