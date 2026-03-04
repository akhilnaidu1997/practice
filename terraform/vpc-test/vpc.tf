module "main" {
    source = "../vpc"
    cidr = "10.0.0.0/16"
    tenancy = "default"
    VPC_region = "us-east-1"
    Project = "Roboshop"
    Env = "dev"
}
