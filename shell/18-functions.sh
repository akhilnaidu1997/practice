#!/bin/bash

USER=$(id -u)

if [ $USER -ne 0 ]; then
    echo "ERROR:: please proceed with sudo previlages"
    exit 1
fi

VALIDATE() {
    if [ $1 -ne 0 ]; then
        echo "$2 installation is failed"
    else
        echo "$2 installation is success"
    fi
}

dnf install mysql -y 
VALIDATE $? mysql

dnf install nginx -y
VALIDATE $? nginx

dnf install python -y
VALIDATE $? python