#!/bin/bash

NUM=$1

if [ $(($NUM % 2)) -eq 0 ]; then
    echo "Given number $NUM is even"
else
    echo "Given number $NUM is odd"
fi
