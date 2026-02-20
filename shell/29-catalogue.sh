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

LOG_FOLDER="/var/log/shell-script"
SCRIPT=$( echo $0 | cut -d "." -f1)
LOG_FILE="$LOG_FOLDER/$SCRIPT.log"

mkdir -p $LOG_FOLDER

VALIDATE() {
    if [ $1 -ne 0 ]; then
        echo -e "$RED $2  is failed $N" | tee -a $LOG_FILE
        exit 1
    else
        echo -e "$GREEN $2  is success $N" | tee -a $LOG_FILE
    fi
}

dnf module disable nodejs -y
VALIDATE $? "disabled"

dnf module enable nodejs:20 -y
VALIDATE $? "enabled"

dnf install nodejs -y
VALIDATE $? "nodejs"

id roboshop
if [ $? -ne 0 ]; then
    useradd --system --home /app --shell /sbin/nologin --comment "roboshop system user" roboshop
    VALIDATE $? "user created"
else
    echo "roboshop user is already created"
fi

mkdir -p /app 
VALIDATE $? "/app"

curl -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue-v3.zip 
cd /app 
unzip /tmp/catalogue.zip
VALIDATE $? "unzip"

npm install
VALIDATE $? "install dependencies"

cp ./catalogue.service /etc/systemd/system/catalogue.service
VALIDATE $? "copy service file"

systemctl daemon-reload

systemctl enable catalogue 
systemctl start catalogue

cp mongo.repo /etc/yum.repos.d/mongo.repo

dnf install mongodb-mongosh -y

mongosh --host mongodb.daws86s-akhil.shop </app/db/master-data.js
