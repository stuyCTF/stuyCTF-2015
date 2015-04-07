#!/bin/bash

PORT=1235
echo -e "$$ ${PORT}" > ../../format-overflow.pid
while true; do
    nc -l -p $PORT -e ./format-overflow
done
