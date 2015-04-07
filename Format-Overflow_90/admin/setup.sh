#!/bin/bash

PORT=12346
echo -e "$$ ${PORT}" > ../../format-overflow.pid
while true; do
    /bin/nc.traditional -l -p $PORT -e ./format-overflow
done
