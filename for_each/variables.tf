variable "instances" {
    default = {
        mongodb = "t2.micro"
        mysql = "t3.micro"
        redis = "t2.medium"
    }
  
}