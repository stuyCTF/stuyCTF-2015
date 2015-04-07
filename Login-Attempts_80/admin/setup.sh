#!/bin/bash

PORT=49999
echo -e "$$ ${PORT}" > ../../login-attempts.pid
while true; do
    tcpserver 0.0.0.0 $PORT ./login.py 2> /dev/null
done
