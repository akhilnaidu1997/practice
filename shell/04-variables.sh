#!/bin/bash #here we are using bash shell, shebang tells OS which interpreter/shell to be used during execution

PERSON1=$1
PERSON2=$2

echo "$PERSON1: Hello $PERSON2, how are you"
echo "$PERSON2: Hello $PERSON1, I am fine. How are you"
echo $@