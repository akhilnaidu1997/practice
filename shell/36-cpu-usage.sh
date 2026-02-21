#!/bin/bash
# Capture the second iteration of top for accurate idle time
IDLE=$(top -b -n2 | grep "Cpu(s)" | tail -1 | awk '{print $8}')
CPU_USAGE=$(echo "scale=2; 100 - $IDLE" | bc)
echo "CPU Usage: $CPU_USAGE%"