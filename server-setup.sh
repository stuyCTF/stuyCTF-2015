#!/bin/bash

# Generate valid server format
echo "================================================================================
Generating problems...
================================================================================"
python generate_problem_format.py

# Copy problems to server
echo "================================================================================
Copying problems to server...
================================================================================"
mkdir -p ../stuyCTF-Platform/problems
cp -r STUYCTF_SERVER/* ../stuyCTF-Platform/problems
