#!/bin/bash

RAM_USAGE=$(free -m | awk '/Mem:/ {printf("RAM Used: %.2f%%\n", $3/$2*100)}')
RAM_THRESHOLD=20

if [ $RAM_USAGE -ge $RAM_THRESHOLD ]; then
    MESSAGE="High RAM usage: $RAM_USAGE"
fi
