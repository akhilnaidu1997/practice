#!/bin/bash

USER=$(id -u)

if [ $USER -ne 0 ]; then
    echo "ERROR:: please proceed with sudo previlages"
    exit 1
fi

dnf install mysql -y 

if [ $? -ne 0 ]; then
    echo "Mysql installation is failed"
else
    echo "Mysql installation is success"
fi
