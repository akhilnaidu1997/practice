resource "aws_instance" "Test" {
    ami = var.ami_id
    instance_type = var.env == "dev" ? "t3.medium" : "m5.large"
    vpc_security_group_ids = [  ]

    tags = {
      Name = "Terraform"
    }
}

resource "aws_security_group" "allow" {
    name = "allow_all"

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