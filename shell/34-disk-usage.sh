#!/bin/bash

DISK_USAGE=$(df -h | grep -v Filesystem)
DISK_THRESHOLD=80
MESSAGE=""

while IFS= read -r disk
do
    USAGE=$(echo $disk | | awk '{print $5}' | cut -d "%" -f1)
    PARTITION=$(echo $disk | awk '{print $6}')
    if [ $USAGE -ge $DISK_THRESHOLD ]; then
        MESSAGE+="High disk usage on $PARTITION: $DISK_USAGE %"
    fi
done <<< $DISK_USAGE

echo "Message Body: $MESSAGE"
