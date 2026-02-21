#!/bin/bash

DISK_USAGE=$(df -h | grep -v Filesystem | awk '{print $5}' | cut -d "%" -f1)
DISK_THRESHOLD=80
MESSAGE=""

while IFS= read -r disk
do
    PARTITION=$(df -h | grep -v Filesystem | awk '{print $6}')
    if [ $DISK_USAGE -ge $DISK_THRESHOLD ]; then
        MESSAGE+="High disk usage on $PARTITION: $DISK_USAGE"
    fi
done <<< $DISK_USAGE

echo -e "Message Body: $MESSAGE"
