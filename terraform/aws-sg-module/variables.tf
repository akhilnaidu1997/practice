variable "sg_name" {
    type = string

}

variable "vpc_id" {
    type = string

}

variable "description" {
    type = string

}

variable "sg_tags" {
    type = map
    default = {}
}

variable "project" {
    type = string
  
}
variable "env" {
    type = string
  
}
