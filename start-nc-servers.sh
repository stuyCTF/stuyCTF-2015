#!/bin/bash

if [[ -x /bin/nc.traditional ]]; then
    echo "netcat-traditional is all set up!"
else
    echo "Installing netcat-traditional...."
    sudo apt-get install netcat-traditional
    sudo update-alternatives --set nc /bin/nc.traditional
fi
echo "Running servers...."
echo "Deploying Easy-Overflow...."
bash -c "cd Easy-Overflow_60/admin/ && ./setup.sh" &
echo "Deploying Format-Overflow...."
bash -c "cd Format-Overflow_90/admin/ && ./setup.sh" &
