module "network" {
  source = "./modules/network"

  name = "dos_15_mikhalenka_vpc"
  cidr = "10.0.0.0/16"
  az_a   = "us-east-1a"
  az_b   = "us-east-1b"
  az_c   = "us-east-1c"

  public_a_subnet_cidr  = "10.0.1.0/24"
  public_b_subnet_cidr  = "10.0.2.0/24"
  public_c_subnet_cidr  = "10.0.3.0/24"

  route_table_cidr = "0.0.0.0/0"

  enable_dns_hostnames = true
  enable_dns_support   = true
}

module "security" {
  source = "./modules/security"

  name = "dos_15_mikhalenka_sg"
  vpc_id = module.network.vpc_id

  ingress = [
    {
      description = "Allow http from everywhere"
      from_port  = 80
      to_port    = 80
      protocol   = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      description = "Allow ssh from everywhere"
      from_port  = 22
      to_port    = 22
      protocol   = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]

  egress = [
    {
      description = "Allow outgoing traffic"
      from_port  = 0
      to_port    = 0
      protocol   = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]

  lb_name = "dos-15-mikhalenka-alb"
  internal = false
  load_balancer_type = "application"

  lb_port = "80"
  lb_protocol = "HTTP"
  lb_type = "forward"

  tg_name = "dos-15-mikhalenka-tg"
  tg_type = "instance"
  tg_port = "80"
  tg_protocol = "HTTP"

  subnet_id_a       = module.network.public_a_subnet_id
  subnet_id_b       = module.network.public_b_subnet_id
  subnet_id_c       = module.network.public_c_subnet_id
}

module "compute" {
  source = "./modules/compute"

  my_tg_arn         = module.security.my_tg_arn
  security_group_id = module.security.security_group_id
  subnet_id_a       = module.network.public_a_subnet_id
  subnet_id_b       = module.network.public_b_subnet_id
  subnet_id_c       = module.network.public_c_subnet_id

  lt_name = "dos_15_mikhalenka_lt"
  instance_type = "t2.micro"
  key_name = "DOS_15_Mikhalenka"
  volume_size = 8
  volume_type = "gp2"
  device_name = "/dev/sda1"
  associate_public_ip_address = true

  asg_name = "dos_15_mikhalenka_asg"
  max_size = 5
  min_size = 2
  health_check_type = "ELB"
  desired_capacity = 2

  asp_up_name = "dos_mikhalenka_asp"
  asp_up_policy_type = "SimpleScaling"
  asp_up_adjustment_type = "ChangeInCapacity"
  asp_up_ascaling_adjustment = 1
  asp_up_acooldown = 300

  asp_up_alarm_name = "dos_mikhalenka_up_alarm"
  asp_up_alarm_description = "This alarm will trigger when the average CPU utilization exceeds 70%"
  asp_up_comparison_operator = "GreaterThanThreshold"
  asp_up_evaluation_periods = 2
  asp_up_metric_name = "CPUUtilization"
  asp_up_namespace = "AWS/EC2"
  asp_up_period = 120
  asp_up_statistic = "Average"
  asp_up_threshold = 50
  asp_up_actions_enabled = true

  asp_down_name = "dos_mikhalenka_down_asp"
  asp_down_policy_type = "SimpleScaling"
  asp_down_adjustment_type = "ChangeInCapacity"
  asp_down_ascaling_adjustment = -1
  asp_down_acooldown = 300

  asp_down_alarm_name = "dos_mikhalenka_down_alarm"
  asp_down_alarm_description = "This alarm will trigger when the average CPU utilization is below 30%"
  asp_down_comparison_operator = "LessThanOrEqualToThreshold"
  asp_down_evaluation_periods = 2
  asp_down_metric_name = "CPUUtilization"
  asp_down_namespace = "AWS/EC2"
  asp_down_period = 120
  asp_down_statistic = "Average"
  asp_down_threshold = 30
  asp_down_actions_enabled = true
}

