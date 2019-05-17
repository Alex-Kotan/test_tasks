#!/bin/bash

RESULT=$(git diff --cached --name-only |grep -l *.py)
RESFILES=$(grep -q -l $'\t' $RESULT)

if grep -q -l $'\t' $RESULT;  then
    echo Sorry, your commit aborted: change tabs in files: $RESFILES
    exit 1
else
    exit 0
fi

