#!/bin/bash

PID=$$
PORT=50000
TYPE=python
echo -e "${PID} ${PORT} ${TYPE}" > ../../rock-paper-scissors.pid
while true; do
    python server.py
done
