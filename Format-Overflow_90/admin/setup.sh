#!/bin/bash

if [[ -x /bin/nc.traditional ]]; then
    echo "netcat-traditional is all set up!"
else
    echo "Installing netcat-traditional...."
    sudo apt-get install netcat-traditional
    sudo update-alternatives --set nc /bin/nc.traditional
fi
echo "Running server...."
while true; do
    nc -l -p 1235 -e ./format-overflow
done
