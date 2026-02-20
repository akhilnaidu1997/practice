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
        echo -e "$RED $2  is failed $N"
        exit 1
    else
        echo -e "$GREEN $2  is success $N"
    fi
}

cp mongo.repo /etc/yum.repos.d/mongo.repo
VALIDATE $? "file copied to desired location"

dnf install mongodb-org -y 
VALIDATE $? "mongodb-org"

systemctl enable mongod 
systemctl start mongod 
VALIDATE $? "started"

sed -i 's/127.0.0.1/0.0.0.0/' /etc/mongod.conf
VALIDATE $? "line change"

systemctl restart mongod
VALIDATE $? "restarted service"