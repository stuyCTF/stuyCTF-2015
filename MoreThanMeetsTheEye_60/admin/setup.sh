#!/bin/bash

PID=$$
PORT=49998
TYPE=tcpserver
echo -e "${PID} ${PORT} ${TYPE}" > ../../more-than-meets-the-eye.pid
while true; do
    tcpserver 0.0.0.0 $PORT ./yoloswag.py 2> /dev/null
done
