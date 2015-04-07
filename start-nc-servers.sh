#!/bin/bash

if [[ -x /usr/bin/tcpserver ]]; then
    echo "tcpserver is all set up!"
else
    echo "Installing ucspi-tcp...."
    sudo apt-get install ucspi-tcp
fi
echo "Running servers...."
echo "Deploying Easy-Overflow...."
bash -c "cd Easy-Overflow_60/admin/ && ./setup.sh" &
echo "Deploying Format-Overflow...."
bash -c "cd Format-Overflow_90/admin/ && ./setup.sh" &
echo "Deploying Rock-Paper-Scissors...."
bash -c "cd Rock-Paper-Scissors_150/admin/ && ./setup.sh" &
