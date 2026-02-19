#!/bin/bash

echo "All arguments/variables passed to the script: $@"
echo "All arguments/variables passed to the script: $*"
echo "script name: $0"
echo "current directory: $PWD"
echo "current user: $USER"
echo "home directory of current user: $HOME"
echo "PID of the current script: $$"
sleep 10 &
echo "PID of the last command in background: $!"