resource "aws_route53_record" "records" {
    for_each = aws_instance.demo
    zone_id = "zone-289384765"
    name = "${each.key}.daws86s-akhil.shop"
    ttl = 1
    type = "A"
    records = [ each.value.private_ip ]
  
}