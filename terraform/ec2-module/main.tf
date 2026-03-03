resource "aws_instance" "main" {
    ami = var.ami_id
    instance_type = var.instance_type
    vpc_security_group_ids = [ aws_security_group.sg_01.id]

    tags = {
      Project = "Roboshop"
      environment = "dev"
      Terraform = "True"
    }
}

resource "aws_security_group" "sg_01" {
    name = var.sg_01

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = [ "0.0.0.0/0" ]
    }

    ingress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = [ "0.0.0.0/0" ]
    }
  
}