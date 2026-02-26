resource "aws_route53_record" "Project" {
    count = 2
    zone_id = "zone-id"
    name ="${var.name[count.index]}.${var.domain_name}"
    type = "A"
    ttl = 1
    records = [ aws_instance.Test[count.index].private_ip ]
}