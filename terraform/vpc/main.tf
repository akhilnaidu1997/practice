resource "aws_vpc" "main" {
    cidr_block = var.cidr
    instance_tenancy = "default"
    enable_dns_hostnames = true

    tags = merge(
        local.common_tags,
        var.VPC_tags,{
            Name = "${local.common_name}-vpc"
        }
    )
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = merge(
        local.common_tags,
        var.VPC_tags,{
            Name = "${local.common_name}-igw"
        }
    )
}

resource "aws_subnet" "public_subnet" {
    count = length(var.public_cidr)
    vpc_id = aws_vpc.main.id
    cidr_block = var.public_cidr[count.index]
    availability_zone = local.az_names[count.index]
    map_public_ip_on_launch = true

    tags = merge(
        local.common_tags,
        var.VPC_tags,{
            Name = "${local.common_name}-public"
        }
    ) 
}

resource "aws_subnet" "private_subnet" {
    count = length(var.private_cidr)
    vpc_id = aws_vpc.main.id
    cidr_block = var.private_cidr[count.index]
    availability_zone = local.az_names[count.index]

    tags = merge(
        local.common_tags,
        var.VPC_tags,{
            Name = "${local.common_name}-private"
        }
    ) 
}

resource "aws_subnet" "database_subnet" {
    count = length(var.database_cidr)
    vpc_id = aws_vpc.main.id
    cidr_block = var.database_cidr[count.index]
    availability_zone = local.az_names[count.index]

    tags = merge(
        local.common_tags,
        var.VPC_tags,{
            Name = "${local.common_name}-database"
        }
    ) 
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  tags = merge(
        local.common_tags,
        var.VPC_tags,{
            Name = "${local.common_name}-public"
        }
    ) 
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

  tags = merge(
        local.common_tags,
        var.VPC_tags,{
            Name = "${local.common_name}-private"
        }
    ) 
}

resource "aws_route_table" "database" {
  vpc_id = aws_vpc.main.id

  tags = merge(
        local.common_tags,
        var.VPC_tags,{
            Name = "${local.common_name}-database"
        }
    ) 
}

resource "aws_route" "igw_route" {
  route_table_id            = aws_route_table.public.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.gw.id
}

resource "aws_eip" "main" {
    domain = "vpc"
    tags = merge(
        local.common_tags,
        var.VPC_tags,{
            Name = "${local.common_name}-eip"
        }
    )
}

resource "aws_nat_gateway" "example" {
  allocation_id = aws_eip.main.id
  subnet_id     = aws_subnet.public_subnet[0].id
  tags = merge(
        local.common_tags,
        var.VPC_tags,{
            Name = "${local.common_name}-NAT"
        }
    )
  depends_on = [aws_internet_gateway.gw]
}

resource "aws_route" "nat_private" {
  route_table_id            = aws_route_table.private.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id = aws_nat_gateway.example.id
}

resource "aws_route" "nat_route" {
  route_table_id            = aws_route_table.database.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id = aws_nat_gateway.example.id
}

resource "aws_route_table_association" "a" {
  count = length(var.public_cidr)
  subnet_id      = aws_subnet.public_subnet[count.index].id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "b" {
  count = length(var.private_cidr)
  subnet_id      = aws_subnet.private_subnet[count.index].id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "d" {
  count = length(var.database_cidr)
  subnet_id      = aws_subnet.database_subnet[count.index].id
  route_table_id = aws_route_table.database.id
}