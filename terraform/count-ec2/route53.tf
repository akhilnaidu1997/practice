resource "aws_route53_record" "name" {
    count = length(var.instances)
    zone_id = "z09476382"
    name = "${var.instances[count.index]}.${daws86s-akhil.shop}"
    type = "A"
    ttl = 1
    records = [ aws_instance.name[count.index].private_ip ]
  
}