#!/bin/bash

USER=$(id -u)

if [ $USER -ne 0 ]; then
    echo "ERROR:: please proceed with sudo previlages"
    exit 1
fi

dnf install mysql -y 

if [ $? -ne 0 ]; then
    echo "Mysql installation is failed"
    exit 1
else
    echo "Mysql installation is success"
fi

dnf install nginx -y

if [ $? -ne 0 ]; then
    echo "nginx installation is failed"
    exit 1
else
    echo "nginx installation is success"
fi

dnf install python -y

if [ $? -ne 0 ]; then
    echo "python installation is failed"
    exit 1
else
    echo "python installation is success"
fi