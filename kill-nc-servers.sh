#!/bin/bash

if [[ -f easy-overflow.pid ]]; then
    read line < easy-overflow.pid
    pid=$(echo $line | cut -d " " -f 1)
    port=$(echo $line | cut -d " " -f 2)
    echo "Killing process for Easy Overflow (${pid})"
    kill -9 $pid
    pid=$(netstat -lpn 2> /dev/null | grep "0.0.0.0:${port}" | grep -o "[0-9]*/nc" | cut -d '/' -f 1)
    if [[ $pid != "" ]]; then
        echo "Closing port ${port}.... (${pid})"
        kill -9 $pid
    fi
    rm easy-overflow.pid
fi
if [[ -f format-overflow.pid ]]; then
    read line < format-overflow.pid
    pid=$(echo $line | cut -d " " -f 1)
    port=$(echo $line | cut -d " " -f 2)
    echo "Killing process for Format Overflow (${pid})"
    kill -9 $pid
    pid=$(netstat -lpn 2> /dev/null | grep "0.0.0.0:${port}" | grep -o "[0-9]*/nc" | cut -d '/' -f 1)
    if [[ $pid != "" ]]; then
        echo "Closing port ${port}.... (${pid})"
        kill -9 $pid
    fi
    rm format-overflow.pid
fi
