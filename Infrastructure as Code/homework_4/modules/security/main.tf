resource "aws_security_group" "sg" {
  name        = var.name
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    for_each = var.ingress
    content {
      description = ingress.value.description
      from_port  = ingress.value.from_port
      to_port    = ingress.value.to_port
      protocol   = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

  dynamic "egress" {
    for_each = var.egress
    content {
      description = egress.value.description
      from_port  = egress.value.from_port
      to_port    = egress.value.to_port
      protocol   = egress.value.protocol
      cidr_blocks = egress.value.cidr_blocks
    }
  }

  tags = {
    Name = var.name
  }
  
}

resource "aws_lb" "my_alb" {
  name               = var.lb_name
  internal           = var.internal
  load_balancer_type = var.load_balancer_type
  security_groups    = [aws_security_group.sg.id]
  subnets            = [var.subnet_id_a, var.subnet_id_b, var.subnet_id_c]
}

resource "aws_lb_listener" "my_lb_listener" {
  load_balancer_arn  = aws_lb.my_alb.arn
  port               = var.lb_port
  protocol           = var.lb_protocol

  default_action {
    type             = var.lb_type
    target_group_arn = aws_lb_target_group.my_tg.arn
  }
}

resource "aws_lb_target_group" "my_tg" {
  name               = var.tg_name
  target_type        = var.tg_type
  port               = var.tg_port
  protocol           = var.tg_protocol
  vpc_id = var.vpc_id
}
