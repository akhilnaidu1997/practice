variable "instance" {
    default = "t2.micro"
    type = string
    description = "value"
}

variable "ports" {
    default = [22, 80, 443, 27017]
}