#!/bin/bash

DATE=$(date +%H)

if [ $DATE -lt 12 ]; then
    echo "Good Morning"
elif [ $DATE -lt 18 ]; then
    echo "Good Afternoon"
else
    echo "Good evening"
fi