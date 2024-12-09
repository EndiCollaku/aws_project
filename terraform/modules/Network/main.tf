resource "aws_vpc" "vpc" {
  cidr_block           = var.VPC_CIRD_BLOCK
  enable_dns_hostnames = true

  tags = {
    Name = "${var.APP_NAME}-terraform-vpc"
  }
}

resource "aws_subnet" "subnets" {
  for_each = var.SUBNET_CONFIG

  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = each.value.cidr_block
  availability_zone       = "${var.REGION}${each.value.availability_zone}"
  map_public_ip_on_launch = upper(each.value.public) == "YES"
  tags = {
    Name = "${var.APP_NAME}-${each.key}-subnet"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "${var.APP_NAME}-igw"
  }

}


resource "aws_route_table" "publice_route_table" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id

  }
  tags = {
    Name = "${var.APP_NAME}-public-route_table"
  }
}


resource "aws_route_table_association" "PSA1" {
  for_each = { for k, v in aws_subnet.subnets : k => v if v.map_public_ip_on_launch }

  subnet_id      = each.value.id
  route_table_id = aws_route_table.publice_route_table.id
}

