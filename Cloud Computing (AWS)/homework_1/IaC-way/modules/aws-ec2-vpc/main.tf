resource "aws_vpc" "dos_15_mikhalenka_vpc" {
  cidr_block       = var.vpc_cidr_block
  instance_tenancy = "default"

  tags = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "dos_15_mikhalenka_subnet" {
  vpc_id                  = aws_vpc.dos_15_mikhalenka_vpc.id
  cidr_block              = var.subnet_cidr_block
  map_public_ip_on_launch = true
  availability_zone       = var.aws_az

  tags = {
    Name = var.subnet_name
  }
}

resource "aws_internet_gateway" "dos_15_mikhalenka_ig" {
  vpc_id = aws_vpc.dos_15_mikhalenka_vpc.id

  tags = {
    Name = var.igw_name
  }
}

resource "aws_route_table" "dos_15_mikhalenka_rt" {
  vpc_id = aws_vpc.dos_15_mikhalenka_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.dos_15_mikhalenka_ig.id
  }

  tags = {
    Name = var.rt_name
  }
}

resource "aws_route_table_association" "dos_15_mikhalenka_rt_as" {
  subnet_id      = aws_subnet.dos_15_mikhalenka_subnet.id
  route_table_id = aws_route_table.dos_15_mikhalenka_rt.id
}
