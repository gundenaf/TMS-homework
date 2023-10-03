output "vpc_id" {
  description = "ID of the VPC"
  value       = aws_vpc.dos_15_mikhalenka_vpc.id
}

output "subnet_id" {
  description = "ID of the VPC subnet"
  value       = aws_subnet.dos_15_mikhalenka_subnet.id
}
