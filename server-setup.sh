#!/bin/bash

# Generate valid server format
python generate_problem_format.py

# Copy problems to server
mkdir -p ../stuyCTF-Platform/problems
cp -r STUYCTF_SERVER/* ../stuyCTF-Platform/problems
