#!/bin/bash

PORT=1234
echo -e "$$ ${PORT}" > ../../easy-overflow.pid
while true; do
    nc -l -p $PORT -e ./easy-overflow
done
