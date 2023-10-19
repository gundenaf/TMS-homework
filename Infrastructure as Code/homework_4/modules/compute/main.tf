data "aws_ami" "latest_amazon_linux" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["amazon"]
}

resource "aws_launch_template" "my_launch_template" {
  name          = var.lt_name
  image_id      = data.aws_ami.latest_amazon_linux.id
  instance_type = var.instance_type
  key_name      = var.key_name
  user_data     = filebase64("${path.module}/server.sh")

  block_device_mappings {
    device_name = var.device_name

    ebs {
      volume_size           = var.volume_size
      volume_type           = var.volume_type
      delete_on_termination = true
    }
  }

  network_interfaces {
    associate_public_ip_address = var.associate_public_ip_address
    security_groups             = [var.security_group_id]
  }
}

resource "aws_autoscaling_group" "my_asg" {
  name                = var.asg_name
  max_size            = var.max_size
  min_size            = var.min_size
  health_check_type   = var.health_check_type
  desired_capacity    = var.desired_capacity
  target_group_arns   = [var.my_tg_arn]
  vpc_zone_identifier = [var.subnet_id_a, var.subnet_id_b, var.subnet_id_c]

  launch_template {
    id = aws_launch_template.my_launch_template.id
    version = "$Latest"
  }
}

resource "aws_autoscaling_policy" "scale_up" {
  name                   = var.asp_up_name
  policy_type            = var.asp_up_policy_type
  autoscaling_group_name = aws_autoscaling_group.my_asg.name
  adjustment_type        = var.asp_up_adjustment_type
  scaling_adjustment     = var.asp_up_ascaling_adjustment
  cooldown               = var.asp_up_acooldown
}

resource "aws_cloudwatch_metric_alarm" "scale_up_alarm" {
  alarm_name = var.asp_up_alarm_name
  alarm_description = var.asp_up_alarm_description
  comparison_operator = var.asp_up_comparison_operator
  evaluation_periods = var.asp_up_evaluation_periods
  metric_name = var.asp_up_metric_name
  namespace = var.asp_up_namespace
  period = var.asp_up_period
  statistic = var.asp_up_statistic
  threshold = var.asp_up_threshold
  dimensions = {
    "AutoScalingGroupName" = aws_autoscaling_group.my_asg.name
  }
  actions_enabled = var.asp_up_actions_enabled
  alarm_actions = [aws_autoscaling_policy.scale_up.arn]
}

resource "aws_autoscaling_policy" "scale_down" {
  name                   = var.asp_down_name
  policy_type            = var.asp_down_policy_type
  autoscaling_group_name = aws_autoscaling_group.my_asg.name
  adjustment_type        = var.asp_down_adjustment_type
  scaling_adjustment     = var.asp_down_ascaling_adjustment
  cooldown               = var.asp_down_acooldown
}

resource "aws_cloudwatch_metric_alarm" "scale_down_alarm" {
  alarm_name = var.asp_down_alarm_name
  alarm_description = var.asp_down_alarm_description
  comparison_operator = var.asp_down_comparison_operator
  evaluation_periods = var.asp_down_evaluation_periods
  metric_name = var.asp_down_metric_name
  namespace = var.asp_down_namespace
  period = var.asp_down_period
  statistic = var.asp_down_statistic
  threshold = var.asp_down_threshold
  dimensions = {
    "AutoScalingGroupName" = aws_autoscaling_group.my_asg.name
  }
  actions_enabled = var.asp_down_actions_enabled
  alarm_actions = [aws_autoscaling_policy.scale_up.arn]
}