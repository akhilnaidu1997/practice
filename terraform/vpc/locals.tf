locals {
  common_name = "${var.Project}-${var.Env}"
  common_tags = {
    Project = "${var.Project}"
    Environment = "${var.Env}"
    Terraform = true
  }
  az_names = slice(data.aws_availability_zones.az.names,0,2)
}