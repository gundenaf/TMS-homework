resource "aws_vpc" "main" {
  cidr_block = var.cidr
  enable_dns_hostnames = var.enable_dns_hostnames
  enable_dns_support = var.enable_dns_support

  tags = {
    Name = var.name
  }
}

resource "aws_subnet" "public_a" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.public_a_subnet_cidr
  availability_zone = var.az_a

  tags = {
    Name = "public_a"
  }
}

resource "aws_subnet" "public_b" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.public_b_subnet_cidr
  availability_zone = var.az_b

  tags = {
    Name = "public_b"
  }
}

resource "aws_subnet" "public_c" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.public_c_subnet_cidr
  availability_zone = var.az_c

  tags = {
    Name = "public_c"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = var.name
  }
}

resource "aws_route_table" "main" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = var.route_table_cidr
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = var.name
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.public_a.id
  route_table_id = aws_route_table.main.id
}

resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.public_b.id
  route_table_id = aws_route_table.main.id
}

resource "aws_route_table_association" "c" {
  subnet_id      = aws_subnet.public_c.id
  route_table_id = aws_route_table.main.id
}
