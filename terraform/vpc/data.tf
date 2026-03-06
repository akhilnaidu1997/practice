data "aws_availability_zones" "az" {
    state = "available"
}

data "aws_vpc" "default" {
    state = "available"
  
}

data "aws_route_table" "name" {
  vpc_id = data.aws_vpc.default.id
  filter {
    name   = "association.main"
    values = ["true"]
  }
}


