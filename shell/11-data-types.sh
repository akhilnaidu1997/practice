#!/bin/bash

# in linux we donot have specific data types
# linux will consider everything as a string

COURSE="DevSecOps"
DURATION=120

echo "Course name: ${COURSE} and duration is ${DURATION}"

NAME=("MODI" "PUTIN" "TRUMP" "MACRON")
echo "print all names in the list :${NAME[@]}"
echo "print first in list: ${NAME[0]}"
echo "second in the list: ${NAME[1]}"
echo "Third in the list: ${NAME[2]}"