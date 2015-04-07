#!/bin/bash

PID=$$
PORT=12346
TYPE=tcpserver
echo -e "${PID} ${PORT} ${TYPE}" > ../../format-overflow.pid
while true; do
    tcpserver 0.0.0.0 $PORT ./format-overflow
done
