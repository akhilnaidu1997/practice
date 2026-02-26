resource "aws_instance" "Test" {
    ami = var.ami_id
    instance_type = var.instance_type
    vpc_security_group_ids = [ aws_security_group.allow.id ]

    tags = {
      Name = "Test"
      Terraform = "True"
    }
  
}

resource "aws_security_group" "allow" {
    name = "allow_all"

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
  
}