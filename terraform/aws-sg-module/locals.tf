locals {
    common_name = "${var.project}-${var.env}"
    common_tags = {
        Project = "Roboshop"
        Environment = "Dev"
        Terraform = true
    }
}