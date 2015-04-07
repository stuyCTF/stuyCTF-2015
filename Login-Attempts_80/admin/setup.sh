#!/bin/bash

PID=$$
PORT=49999
TYPE=tcpserver
echo -e "${PID} ${PORT} ${TYPE}" > ../../login-attempts.pid
while true; do
    tcpserver 0.0.0.0 $PORT ./login.py 2> /dev/null
done
