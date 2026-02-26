resource "aws_instance" "demo" {
    for_each = var.instances
    ami = "ami-1928376458"
    instance_type = "t2.micro"
    subnet_id = "subnet-192874"
    vpc_security_group_ids = [ aws_security_group.allow.id ]

    tags = {
      Name = each.key
      Terraform = "true"
    }
}

resource "aws_security_group" "allow" {
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