#!/bin/bash

echo $SHELL
echo $0

#string manipulation

str="DevOpsEngineer"

echo ${#str}
echo ${str:0:6}
echo ${str/Engineer/Admin}