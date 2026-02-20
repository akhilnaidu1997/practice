#!/bin/bash

for i in $@
do
    dnf list installed $i
    if [ $? -ne 0 ]; then
        dnf install $i -y
    else
        echo "$i already installed"
    fi
done