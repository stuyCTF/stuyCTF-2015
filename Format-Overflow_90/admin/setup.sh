#!/bin/bash

PORT=12346
echo -e "$$ ${PORT}" > ../../format-overflow.pid
while true; do
    tcpserver 0.0.0.0 $PORT ./format-overflow
done
