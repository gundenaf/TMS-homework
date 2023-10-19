output "vpc_id" {
  value       = module.network.vpc_id
  description = "The ID of the VPC"
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

output "my_tg_arn" {
  description = "ARN of the target group"
  value       = module.security.my_tg_arn
}

output "public_a_subnet_id" {
  description = "The ID of the public subnet a"
  value       = module.network.public_a_subnet_id
}

output "public_b_subnet_id" {
  description = "The ID of the public subnet b"
  value       = module.network.public_b_subnet_id
}

output "public_c_subnet_id" {
  description = "The ID of the public subnet c"
  value       = module.network.public_c_subnet_id
}

