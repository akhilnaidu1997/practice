#!/bin/bash
# Capture the second iteration of top for accurate idle time
IDLE=$(top -b -n2 | grep "Cpu(s)" | tail -1 | awk '{print $8}')
CPU_USAGE=$(echo "scale=2; 100 - $IDLE" | bc) # bc (basic calculator)
echo "CPU Usage: $CPU_USAGE%"

#simple
top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8"% used"}'

# top command
# IDLE cpu % and we cant calculate 100-$IDLE to get the used %
# echo "cpu usage: $USED"

#RAM from free -h
# get the used RAM used awk cmd
# calculate used RAM/total RAM * 100
# print the RAM percentage used and send mail if goes beyond htreshodl

