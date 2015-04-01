#!/bin/bash

if [ $# -gt 0 ];
then
    PROBLEM_NAME=$1

    mkdir -p $PROBLEM_NAME/{release,admin}
    touch $PROBLEM_NAME/solution.txt
    cp sample-problem.txt $PROBLEM_NAME/problem.txt
    cp sample-grader.py $PROBLEM_NAME/grader.py
    cp sample-weightmap.json $PROBLEM_NAME/sample-weightmap.json
    cp sample-hint.txt $PROBLEM_NAME/hint.txt
fi
