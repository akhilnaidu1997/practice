#!/bin/bash

FILE="/etc/hosts"

if [ -f $FILE ] && [ -r $FILE ]; then
    echo "$FILE exists and readable"
else
    echo "$FILE is not exists"
fi
