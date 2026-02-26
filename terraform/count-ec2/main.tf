resource "aws_instance" "name" {

    count = length(var.instances)
    ami = "ami-298476"
    instance_type = "m5.large"
    vpc_security_group_ids = [ aws_security_group.allow-all.id ]
    subnet_id = "subnet-1094875"

    tags = {
      Name = var.instances[count.index]
      Terraform = true
    }
  
}

resource "aws_security_group" "allow-all" {
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


