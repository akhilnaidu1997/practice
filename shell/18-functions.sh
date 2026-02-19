#!/bin/bash

USER=$(id -u)

if [ $USER -ne 0 ]; then
    echo "ERROR:: please proceed with sudo previlages"
    exit 1
fi

VALIDATE() {
    if [ $1 -ne 0 ]; then
        echo "$2 installation is failed"
        exit 1
    else
        echo "$2 installation is success"
    fi
}

dnf list installed mysql
if [ $? -ne 0 ]; then
    dnf install mysql -y 
    VALIDATE $? mysql
fi

dnf list installed nginx
if [ $? -ne 0 ]; then
    dnf install nginx -y 
    VALIDATE $? nginx
fi

dnf list installed python
if [ $? -ne 0 ]; then
    dnf install python -y 
    VALIDATE $? python
fi