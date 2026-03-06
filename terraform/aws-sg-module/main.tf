resource "aws_security_group" "main" {
    name = var.sg_name
    vpc_id = var.vpc_id
    description = var.description

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = [ "0.0.0.0/0" ]
    }
  
    tags = merge(
        local.common_tags, var.sg_tags, {
            Name = "${local.common_name}-${var.sg_name}"
        }
    )
}