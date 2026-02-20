aws ec2 run-instances \
 --image-id ami-0220d79f3f480ecf5 \ # Replace with your desired AMI ID
 --count 1 \
 --instance-type t2.micro \
 --security-group-ids sg-084659653bcf2b298 \
 --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=Test}]'
 --query "Instances[0].InstanceId" --output text

aws ec2 describe-instances --instance-ids i-053d01d399d094330 --query "Reservations[0].Instances[0].PublicIpAddress" --output text

aws ec2 describe-instances --instance-ids i-053d01d399d094330 --query "Reservations[0].Instances[0].PrivateIpAddress" --output text

