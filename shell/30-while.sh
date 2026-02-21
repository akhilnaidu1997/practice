#!/bin/bash

# count=5
# while [ $count -gt 0 ]
# do
#     echo "count $count"
#     count=$((count-1))
# done

while IFS= read -r line 
do
    echo "Line: $line"
done < 29-catalogue.sh