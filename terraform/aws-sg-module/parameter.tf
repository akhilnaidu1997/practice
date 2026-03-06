resource "aws_ssm_parameter" "main" {
    name  = "/${var.project}-/${var.env}-/${var.sg_name}"
    type  = "String"
    value = aws_security_group.main.id
}