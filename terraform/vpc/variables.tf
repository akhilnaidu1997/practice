variable "cidr" {
    type = string
}

variable "tenancy" {
    type = string
}

variable "VPC_region" {
    type = string
}

variable "Project" {
    type = string
}

variable "Env" {
    type = string
}

variable "VPC_tags" {
    type = map
    default = {}
}

variable "public_cidr" {
    default = ["10.0.1.0/24","10.0.2.0/24"]
}

variable "private_cidr" {
    default = ["10.0.11.0/24","10.0.12.0/24"]
}

variable "database_cidr" {
    default = ["10.0.21.0/24","10.0.22.0/24"]
}
