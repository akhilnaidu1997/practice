data "aws_ami" "ami_name" {
    most_recent = true
    owners      = ["973714476881"]

    filter {
        name   = "name"
        values = ["Redhat-9-DevOps-Practice"]
    }
    filter {
        name   = "architecture"
        values = ["x86_64"]
    }
    filter {
        name   = "root-device-type"
        values = ["ebs"]
    }
  
}

# output "aws_ami" {
#     value = data.aws_ami.ami_name.id
  
# }