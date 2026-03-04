module "ec2" {
    source = "./ec2-module"
    ami_id = "ami-0220d79f3f480ecf5"
    sg_01 = "sg01"
    instance_type = "t2.large"
}

output "public_ip" {
    value = module.ec2.public_ip
}

output "private_ip" {
    value = module.ec2.private_ip
  
}