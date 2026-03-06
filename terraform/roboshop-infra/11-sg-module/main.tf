module "main" {
    source = "../../aws-sg-module"
    vpc_id = data.aws_ssm_parameter.name.value
    project = var.project
    env = var.env
    description = var.desc
    sg_name = var.sg_name
  
}