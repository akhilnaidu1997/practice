resource "aws_instance" "remote" {
    ami = local.ami_id
    instance_type = var.instance
    vpc_security_group_ids = [ aws_security_group.allow_all.id ]
    #subnet_id = "subnet-183765738"

    provisioner "local-exec" {
        command = "echo ${self.public_ip} > inventory"
        on_failure = continue
    }

    provisioner "local-exec" {
        command = "echo destroying instances"
        when = destroy
    }

    connection {
      type = "ssh"
      user = "ec2-user"
      password = "DevOps321"
      host = "${self.public_ip}"
    }

    provisioner "remote-exec" {
        inline = [ 
            "sudo dnf install nginx -y",
            "sudo systemctl start nginx"
        ]
        on_failure = continue
    }

    provisioner "remote-exec" {
        inline = [ 
            "sudo systemctl stop nginx"
        ]
        when = destroy      
    }

    tags = {
      Name = "terraform"
      Env = "True"
      Project = "Name-proj"
    }
}

resource "aws_security_group" "allow_all" {
    name = "allow-allll"

    dynamic "ingress" {
        for_each = toset(var.ports)
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
        cidr_blocks = ["0.0.0.0/0"]
        protocol = "-1"
    }
  
}