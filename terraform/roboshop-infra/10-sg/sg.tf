resource "aws_security_group" "main" {
  count = length(var.sg_name)
  name = "${var.project}-${var.env}-${var.sg_name[count.index]}"
  vpc_id = data.aws_ssm_parameter.name.id

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [ "0.0.0.0/0" ]
  }
}