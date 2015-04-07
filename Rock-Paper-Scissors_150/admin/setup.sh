#!/bin/bash

PORT=50000
echo -e "$$ ${PORT}" > ../../rock-paper-scissors.pid
while true; do
    python server.py
done
