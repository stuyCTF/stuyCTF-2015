#!/bin/bash

# 770 all dirs, including current
PROBLEM_DIRS=$(ls | grep "_[0-9]*\$")
chmod 770 $PROBLEM_DIRS .
