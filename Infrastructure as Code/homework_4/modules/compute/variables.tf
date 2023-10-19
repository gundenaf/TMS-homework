variable "lt_name" {
  description = "Name of the launch template"
  type        = string
}

variable "instance_type" {
  description = "Instance type for the launch template"
  type        = string
}

variable "key_name" {
  description = "Key name for SSH access"
  type        = string
}

variable "device_name" {
  description = "Device name for the EBS volume"
  type        = string
}

variable "volume_size" {
  description = "Size of the EBS volume in GB"
  type        = number
}

variable "volume_type" {
  description = "Type of EBS volume (e.g., gp2)"
  type        = string
}

variable "associate_public_ip_address" {
  description = "Whether to associate a public IP address"
  type        = bool
}

variable "security_group_id" {
  description = "ID of the security group"
  type        = string
}

variable "asg_name" {
  description = "Name of the Auto Scaling Group"
  type        = string
}

variable "max_size" {
  description = "Maximum number of instances in the Auto Scaling Group"
  type        = number
}

variable "min_size" {
  description = "Minimum number of instances in the Auto Scaling Group"
  type        = number
}

variable "health_check_type" {
  description = "Health check type for the Auto Scaling Group"
  type        = string
}

variable "desired_capacity" {
  description = "Desired capacity for the Auto Scaling Group"
  type        = number
}

variable "my_tg_arn" {
  description = "ARN of the target group"
  type        = string
}

variable "subnet_id_a" {
  description = "ID of subnet A"
  type        = string
}

variable "subnet_id_b" {
  description = "ID of subnet B"
  type        = string
}

variable "subnet_id_c" {
  description = "ID of subnet C"
  type        = string
}

variable "asp_up_name" {
  description = "Name of the scale-up policy"
  type        = string
}

variable "asp_up_policy_type" {
  description = "Type of scale-up policy (e.g., ChangeInCapacity)"
  type        = string
}

variable "asp_up_adjustment_type" {
  description = "Type of adjustment (e.g., ChangeInCapacity)"
  type        = string
}

variable "asp_up_ascaling_adjustment" {
  description = "Scale-up adjustment value"
  type        = number
}

variable "asp_up_acooldown" {
  description = "Cooldown period for the scale-up policy"
  type        = number
}

variable "asp_up_alarm_name" {
  description = "Name of the scale-up alarm"
  type        = string
}

variable "asp_up_alarm_description" {
  description = "Description of the scale-up alarm"
  type        = string
}

variable "asp_up_comparison_operator" {
  description = "Comparison operator for the scale-up alarm"
  type        = string
}

variable "asp_up_evaluation_periods" {
  description = "Number of evaluation periods for the scale-up alarm"
  type        = number
}

variable "asp_up_metric_name" {
  description = "Name of the CloudWatch metric for the scale-up alarm"
  type        = string
}

variable "asp_up_namespace" {
  description = "Namespace of the CloudWatch metric for the scale-up alarm"
  type        = string
}

variable "asp_up_period" {
  description = "Period for the CloudWatch metric for the scale-up alarm"
  type        = number
}

variable "asp_up_statistic" {
  description = "Statistic for the CloudWatch metric for the scale-up alarm"
  type        = string
}

variable "asp_up_threshold" {
  description = "Threshold for the scale-up alarm"
  type        = number
}

variable "asp_up_actions_enabled" {
  description = "Whether actions are enabled for the scale-up alarm"
  type        = bool
}

variable "asp_down_name" {
  description = "Name of the scale-down policy"
  type        = string
}

variable "asp_down_policy_type" {
  description = "Type of scale-down policy (e.g., ChangeInCapacity)"
  type        = string
}

variable "asp_down_adjustment_type" {
  description = "Type of adjustment (e.g., ChangeInCapacity)"
  type        = string
}

variable "asp_down_ascaling_adjustment" {
  description = "Scale-down adjustment value"
  type        = number
}

variable "asp_down_acooldown" {
  description = "Cooldown period for the scale-down policy"
  type        = number
}

variable "asp_down_alarm_name" {
  description = "Name of the scale-down alarm"
  type        = string
}

variable "asp_down_alarm_description" {
  description = "Description of the scale-down alarm"
  type        = string
}

variable "asp_down_comparison_operator" {
  description = "Comparison operator for the scale-down alarm"
  type        = string
}

variable "asp_down_evaluation_periods" {
  description = "Number of evaluation periods for the scale-down alarm"
  type        = number
}

variable "asp_down_metric_name" {
  description = "Name of the CloudWatch metric for the scale-down alarm"
  type        = string
}

variable "asp_down_namespace" {
  description = "Namespace of the CloudWatch metric for the scale-down alarm"
  type        = string
}

variable "asp_down_period" {
  description = "Period for the CloudWatch metric for the scale-down alarm"
  type        = number
}

variable "asp_down_statistic" {
  description = "Statistic for the CloudWatch metric for the scale-down alarm"
  type        = string
}

variable "asp_down_threshold" {
  description = "Threshold for the scale-down alarm"
  type        = number
}

variable "asp_down_actions_enabled" {
  description = "Whether actions are enabled for the scale-down alarm"
  type        = bool
}
