#!/bin/bash

AMI_ID="ami-0220d79f3f480ecf5"
SG_ID="sg-084659653bcf2b298"
ZONE_ID="Z06190873R7XMZC2PKDSV"
DOMAIN_NAME="daws86s-akhil.shop"

for PACKAGE in $@
do
    Instance_ID=$(aws ec2 run-instances --image-id ami-0220d79f3f480ecf5 --count 1  --instance-type t2.micro --security-group-ids $SG_ID --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value='$PACKAGE'}]' --query "Instances[0].InstanceId" --output text)

    if [ "$PACKAGE" != "frontend" ]; then
        IP=$(aws ec2 describe-instances --instance-ids $Instance_ID --query "Reservations[0].Instances[0].PrivateIpAddress" --output text)
        RECORD_NAME="$PACKAGE.$DOMAIN_NAME"
    else
        IP=$(aws ec2 describe-instances --instance-ids $Instance_ID --query "Reservations[0].Instances[0].PublicIpAddress" --output text)
        RECORD_NAME="$DOMAIN_NAME"
    fi

    echo "$PACKAGE: $IP"

    aws route53 change-resource-record-sets \
   --hosted-zone-id $ZONE_ID \
   --change-batch '{
       "Comment": "Update A record for $DOMAIN_NAME ",
       "Changes": [{
           "Action": "UPSERT",
           "ResourceRecordSet": {
               "Name": "'$RECORD_NAME'",
               "Type": "A",
               "TTL": 300,
               "ResourceRecords": [{ "Value": "'$IP'" }]
           }
       }]
   }'
done

