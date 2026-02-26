resource "aws_instance" "Test" {

    ami = data.aws_ami.ami_name.id
    instance_type = var.instance_type
    vpc_security_group_ids = [ resource.aws_security_group.allow_all.id ]

    tags = local.common_tags

  
}

resource "aws_security_group" "allow_all" {
    name = "allow-all-1"

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