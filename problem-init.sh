#!/bin/bash

PROBLEM_NAME=$1

mkdir -p $PROBLEM_NAME/{release,admin}
touch $PROBLEM_NAME/solution.txt
cp problem-sample.txt $PROBLEM_NAME/problem.txt
