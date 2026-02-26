resource "aws_instance" "Test" {
    count = 2
    ami = var.ami
    vpc_security_group_ids = [ aws_security_group.sg_name.id ]
    subnet_id = "subnet-0123456789"
    instance_type = var.instance

    tags = {
      Name = var.name[count.index]
      Project = "name"
      component = "comp-name"
      env = "dev"
    }
}

resource "aws_security_group" "sg_name" {
    name = "allow-all"
    
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
