#!/bin/bash

USER=$(id -u)

if [ $USER -ne 0 ]; then
    echo "ERROR:: Please proceed with the sudo permissions"
    exit 1
fi

LOG_FOLDER="/var/log/shell-script"
SCRIPT=$( echo $0 | cut -d "." -f1)
LOG_FILE="$LOG_FOLDER/$SCRIPT.log"

mkdir -p $LOG_FOLDER

SOURCE_DIR=$1
DEST_DIR=$2

USAGE(){
    echo "USAGE:: sh backupscript.sh <SOURCE> <DEST> <DAYS>(optional)"
    exit 1
}

if [ $# -lt 2 ]; then
    USAGE
fi

if [ ! -d $SOURCE_DIR ]; then
    echo "ERROR:: Source $SOURCE_DIR doesnot exists"
    exit 1
fi

if [ ! -d $DEST_DIR ]; then
    echo "ERROR:: Destination $DEST_DIR doesnot exists"
    exit 1
fi

FILES=$(find $SOURCE_DIR -name "*.log" -type f -mtime +14 )

if [ -z $FILES ]; then
    echo "files exists: $FILES"
fi