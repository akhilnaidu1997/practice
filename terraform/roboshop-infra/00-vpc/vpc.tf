module "main" {
    source = "../vpc"
    cidr = "10.0.0.0/16"
    tenancy = "default"
    VPC_region = "us-east-1"
    Project = "Roboshop"
    Env = "dev"
    is_peering_required = false
}

output "vpc_id" {
    value = module.main.vpc
}

output "public_subnets" {
    value = module.main.public_subnets
}

output "private_subnets" {
    value = module.main.private_subnets
}

output "database_subnets" {
    value = module.main.database_subnets
}