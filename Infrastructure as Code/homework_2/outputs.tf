output "vpc_id" {
  value       = module.network.vpc_id
  description = "The ID of the VPC"
}

output "public_subnet_id" {
  value       = module.network.public_subnet_id
  description = "The ID of the public subnet"
}

output "private_subnet_id" {
  value       = module.network.private_subnet_id
  description = "The ID of the private subnet"
}

output "route_table_id" {
  value       = module.network.route_table_id
  description = "The ID of the route table"
}

output "internet_gateway_id" {
  value       = module.network.internet_gateway_id
  description = "The ID of the internet gateway"
}

output "security_group_id" {
  value       = module.security.security_group_id
  description = "The ID of the security group"
}

output "instance_id" {
  value       = module.compute.instance_id
  description = "The ID of the instance"
}