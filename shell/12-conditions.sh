#!/bin/bash

NUMBER=$1

if [ $NUMBER -lt 10 ]; then
    echo "Given number is less than 10"
elif [ $NUMBER -eq 10 ]; then
    echo "given number is equal to 10"
else
    echo "given number is greater than 10"
fi