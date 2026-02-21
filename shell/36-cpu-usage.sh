#!/bin/bash

CPU_IDLE=$(mpstat 1 1 | awk '/Average/ {print $NF}')
CPU_USAGE=$(awk "BEGIN {print 100 - $CPU_IDLE}")
printf "CPU Usage: %.2f%%\n" "$CPU_USAGE"
