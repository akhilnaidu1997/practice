#!/bin/bash

USER=$(id -u)
RED="\e[31m"
GREEN="\e[32m"
BLUE="\e[34m"
RESET="\e[0m"

if [ $USER -ne 0 ]; then
    echo "ERROR:: Please proceed with the sudo permissions"
    exit 1
fi

LOG_FOLDER="/var/log/shell-script"
SCRIPT=$( echo $0 | cut -d "." -f1)
LOG_FILE="$LOG_FOLDER/$SCRIPT.log"

mkdir -p $LOG_FOLDER # if folder exists then it wont create and wont throw error, if not available then it creates.

VALIDATE(){
    if [ $1 -ne 0 ]; then
        echo -e "$RED $2 is not installed $N" | tee -a $LOG_FILE
        exit 1
    else
        echo "$BLUE $2 is installed $N" | tee -a $LOG_FILE
    fi
}

dnf list installed nginx -y &>> $LOG_FILE
if [ $? -ne 0 ]; then
    dnf install nginx -y &>> $LOG_FILE
    VALIDATE $? "nginx"
else
    echo " $BLUE nginx is already installed $N" | tee -a $LOG_FILE
fi

dnf list installed mysql -y &>> $LOG_FILE
if [ $? -ne 0 ]; then
    dnf install mysql -y &>> $LOG_FILE
    VALIDATE $? "mysql"
else
    echo "$BLUE mysql is already installed $N" | tee -a $LOG_FILE
fi

dnf list installed python -y &>> $LOG_FILE
if [ $? -ne 0 ]; then
    dnf install python -y &>> $LOG_FILE
    VALIDATE $? "python"
else
    echo "$BLUE python is already installed $N" | tee -a $LOG_FILE
fi