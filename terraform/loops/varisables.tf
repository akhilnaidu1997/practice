variable "instance" {
    default = "m5.large"
    type = string
    description = "instance type"
}

variable "ami" {
    default = "ami-19297465"
    type = string
    description = "value"
}

variable "name" {
    default = ["mongodb","mysql"]
    type = list(string) 
}

variable "domain_name" {
    default = "daws86s-akhil.shop"
    type = string
  
}