#!/bin/bash

RED="\033[1;31m"
RESET="\033[m"
# Generate valid server format
echo "================================================================================
Generating problems...
================================================================================"
python generate_problem_format.py

# Copy problems to server
echo "================================================================================
Copying problems to server...
================================================================================"
if [[ -d ../stuyCTF-Platform/problems/ ]]; then
    printf "${RED}../stuyCTF-Platform/problems/ already exists!\n${RESET}"
    echo "Overwrite it? (y/n)"
    read ans
    if [[ $ans == "y" ]]; then
        rm -rf ../stuyCTF-Platform/problems
    else
        exit
    fi
fi
mkdir -p ../stuyCTF-Platform/problems
cp -r STUYCTF_SERVER/* ../stuyCTF-Platform/problems
