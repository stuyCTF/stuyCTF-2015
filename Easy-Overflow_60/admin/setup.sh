#!/bin/bash

PORT=12345
echo -e "$$ ${PORT}" > ../../easy-overflow.pid
while true; do
    tcpserver 0.0.0.0 $PORT ./easy-overflow
done
