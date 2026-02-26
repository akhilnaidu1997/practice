# resource "aws_instance" "Test" {

#     ami = "ami-0220d79f3f480ecf5"
#     instance_type = var.instance_type
#     vpc_security_group_ids = [ resource.aws_security_group.allow_all.id ]

#     tags = {
#         Name = "Terraform"
#     }

  
# }

resource "aws_security_group" "allow_all" {
    name = "allow-all-1"

    dynamic "ingress" {
        for_each = var.ports
        content {
            from_port = ingress.value
            to_port = ingress.value
            protocol = "TCP"
            cidr_blocks = [ "0.0.0.0/0" ]
        }
      
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    
  
}