#!/bin/bash

PORT=12345
echo -e "$$ ${PORT}" > ../../easy-overflow.pid
while true; do
    /bin/nc.traditional -l -p $PORT -e ./easy-overflow
done
