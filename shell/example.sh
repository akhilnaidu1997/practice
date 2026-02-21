#!/bin/bash

SOURCE_DIR=$1
DEST_DIR=$2

if [ $# -lt 2 ]; then
    echo "USAGE:: sh script.sh <source> <dest> <days>(optional)"
    exit 1
fi

if [ ! -d $SOURCE_DIR ]; then
    echo "SOURCE directory $SOURCE_DIR does not exists"
    exit 1
fi

if [ ! -d $DEST_DIR ]; then
    echo "SOURCE directory $DEST_DIR does not exists"
    exit 1
fi

FILES=$(find $SOURCE_DIR -name "*.log" -type f -mtime +14)

if [ ! -z $FILES ]; then
    TIMESTAMP=$(date +%F-%M)
    ZIP_FILE="$DEST_DIR/applogs-$TIMESTAMP.zip"
    echo $FILES | zip $ZIP_FILE
    if [ $? -eq 0 ]; then
        while IFS= read -r file;
        do
            rm -rf $file
        done <<< $FILES
    else
        echo "archival failed"
        exit 1
    fi
else
    echo " No files found to zip"
fi
