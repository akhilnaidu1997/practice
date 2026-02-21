#!/bin/bash

RAM_USAGE=$(free -m | awk '/Mem:/ {printf("%.2f\n", $3/$2*100)}' | cut -d "." -f1)
RAM_THRESHOLD=20
MESSAGE=""

if [ $RAM_USAGE -ge $RAM_THRESHOLD ]; then
    MESSAGE="High RAM usage: $RAM_USAGE"
fi

echo "Message body: $MESSAGE"