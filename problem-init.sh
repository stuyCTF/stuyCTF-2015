#!/bin/bash

if [ $# -gt 0 ];
then
    PROBLEM_NAME=$1

    mkdir -p $PROBLEM_NAME/{release,admin}
    touch $PROBLEM_NAME/solution.txt
    cp sample/sample-problem.txt $PROBLEM_NAME/problem.txt
    cp sample/sample-grader.py $PROBLEM_NAME/grader.py
    cp sample/sample-weightmap.json $PROBLEM_NAME/weightmap.json
    cp sample/sample-hint.txt $PROBLEM_NAME/hint.txt
    cp sample/sample-category.txt $PROBLEM_NAME/category.txt
fi
