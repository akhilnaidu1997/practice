#!/bin/bash

CPU_IDLE=$(top -bn1 | grep "Cpu(s)" | awk '{print $8}')
CPU_USAGE=$(awk "BEGIN {print 100 - $CPU_IDLE}")
printf "CPU Usage: %.2f%%\n" "$CPU_USAGE"