#!/bin/bash

echo $SHELL
echo $0

#string manipulation

str="DevOpsEngineer"

echo ${#str}
echo ${str:0:6}
echo ${str/Engineer/Admin}
---

count=5

while [ $count -le 5]
do
    echo "count: $count"
    ((count--))
done

---
#!/bin/bash

file=$1

if [ -f $file ]; then
    echo "file exists"
else
    echo "file $file doesnot exists"
fi

---
#!/bin/bash

DIR=$1

if [ -d $DIR ]; then
    echo "directory $DIR exists"
else
    echo "directory $DIR doesnot exists.. creating"
    mkdir -p $DIR
fi

# Show top 5 CPU process
ps -eo pid,ppid,comm,%cpu --sort=-%cpu | head -n 6

IDLE=$(top -bn1 | grep Cpu(s) | awk '{print $5})