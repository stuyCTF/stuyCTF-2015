#!/bin/bash

PID=$$
PORT=12345
TYPE=tcpserver
echo -e "${PID} ${PORT} ${TYPE}" > ../../easy-overflow.pid
while true; do
    tcpserver 0.0.0.0 $PORT ./easy-overflow
done
