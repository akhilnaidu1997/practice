#!/bin/bash

USER=$(id -u)
RED="\e[31m"
GREEN="\e[32m"
BLUE="\e[34m"
RESET="\e[0m"

if [ $USER -ne 0 ]; then
    echo "ERROR:: please proceed with sudo previlages"
    exit 1
fi

VALIDATE() {
    if [ $1 -ne 0 ]; then
        echo -e "$RED $2 installation is failed $N"
        exit 1
    else
        echo -e "$GREEN $2 installation is success $N"
    fi
}

dnf list installed mysql
if [ $? -ne 0 ]; then
    dnf install mysql -y 
    VALIDATE $? mysql
else
    echo -e "$BLUE mysql is already installed $N"
fi

dnf list installed nginx
if [ $? -ne 0 ]; then
    dnf install nginx -y 
    VALIDATE $? nginx
else
    echo -e "$BLUE nginx is already installed $N"
fi

dnf list installed python
if [ $? -ne 0 ]; then
    dnf install python -y 
    VALIDATE $? python
else
    echo -e "$BLUE python is already installed $N"
fi