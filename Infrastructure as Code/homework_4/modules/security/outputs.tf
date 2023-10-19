output "security_group_id" {
  description = "The ID of the security group"
  value       = aws_security_group.sg.id
}

output "my_tg_arn" {
  description = "ARN of the target group"
  value       = aws_lb_target_group.my_tg.arn
}