#!/bin/bash

# df -h gives the disk usage on each partition
# Need to read the each line to get the usage  for this we can use loop

DISK_USAGE=$(df -h | grep Filesystem)
DISK_THRESHOLD=80
MESSAGE=""

while IFS= read -r disk;
do
    USAGE=$( echo $disk | awk '{print $5}')
    PARTITION=$( echo $disk | awk '{print $6}')
    if [ $DISK_USAGE -ge $DISK_THRESHOLD ]; then
        MESSAGE+="High disk usage on $PARTITION: $USAGE"
done <<< $DISK_USAGE

echo "Message body: $MESSAGE"

sh mail.sh "to email" "alert type" 