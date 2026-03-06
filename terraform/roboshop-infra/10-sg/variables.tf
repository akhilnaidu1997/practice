variable "project" {
    default = "roboshop"
}
variable "env" {
    default = "dev"
}

variable "sg_name" {
    default = ["mongodb","mysql","redi","rabbitmq","catalogue","user","cart","shipping","payment"]
  
}