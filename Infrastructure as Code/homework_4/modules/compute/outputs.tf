output "launch_template_id" {
  description = "ID of the launch template"
  value       = aws_launch_template.my_launch_template.id
}

output "auto_scaling_group_name" {
  description = "Name of the Auto Scaling Group"
  value       = aws_autoscaling_group.my_asg.name
}

output "scale_up_policy_arn" {
  description = "ARN of the scale-up policy"
  value       = aws_autoscaling_policy.scale_up.arn
}

output "scale_down_policy_arn" {
  description = "ARN of the scale-down policy"
  value       = aws_autoscaling_policy.scale_down.arn
}
