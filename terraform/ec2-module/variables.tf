variable "ami_id" {
    type = string
    description = "ami id "
}

variable "instance_type" {
    type = string
    validation {
      condition = contains(["t2.micro", "t3.medium", "t2.medium"], var.instance_type)
      error_message = "instance type must be one of t2.micro t3.medium t2.medium"
    }

}

variable "sg_01" {
    type = string
}