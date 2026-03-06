resource "aws_ssm_parameter" "vpc_id" {
  name  = "/${var.project}-${var.env}-vpc_id"
  type  = "String"
  value = module.main.vpc.id
}