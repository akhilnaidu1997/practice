output "vpc" {
    value = aws_vpc.main.id
  
}

output "public_subnets" {
    value = aws_subnet.public_subnet[*].id 
}

output "private_subnets" {
    value = aws_subnet.private_subnet[*].id 
}

output "database_subnets" {
    value = aws_subnet.database_subnet[*].id 
}