output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.main.id
}

output "public_a_subnet_id" {
  description = "The ID of the public subnet a"
  value       = aws_subnet.public_a.id
}

output "public_b_subnet_id" {
  description = "The ID of the public subnet b"
  value       = aws_subnet.public_b.id
}

output "public_c_subnet_id" {
  description = "The ID of the public subnet c"
  value       = aws_subnet.public_c.id
}

output "route_table_id" {
  value       = aws_route_table.main.id
  description = "The ID of the route table"
}

output "internet_gateway_id" {
  value       = aws_internet_gateway.igw.id
  description = "The ID of the internet gateway"
}