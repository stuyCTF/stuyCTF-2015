#!/bin/bash

PID=$$
PORT=12348
TYPE=tcpserver
echo -e "${PID} ${PORT} ${TYPE}" > ../../tic-tac-toe.pid
while true; do
    tcpserver 0.0.0.0 $PORT ./ttt
done
