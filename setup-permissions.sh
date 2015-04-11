#!/bin/bash

# 770 all dirs, including current (stuyctf)
PROBLEM_DIRS=$(ls | grep "_[0-9]*\$")
chmod 770 $PROBLEM_DIRS .

# 770 stuyCTF-Platform
if [[ -d ../stuyCTF-Platform ]]; then
    chmod 770 ../stuyCTF-Platform
fi

# 770 /vagrant
if [[ -d /vagrant ]]; then
    sudo chmod 770 /vagrant
fi
