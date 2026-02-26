variable "instance_type" {
    default = "m5.large"
    type = string
    description = "instance type"
}

variable "Project" {
    default = "roboshop"
}

variable "env" {
    default = "dev"
}

variable "tags" {
    default = {
        Project = "roboshop"
        environment = "dev"
        Terraform = true
    }
  
}