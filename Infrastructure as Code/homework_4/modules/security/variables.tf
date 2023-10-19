variable "name" {
  description = "The name of the security group"
  type        = string
}

variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
}

variable "ingress" {
  type    = list(object({
    description = string
    from_port  = number
    to_port    = number
    protocol   = string
    cidr_blocks = list(string)
  }))
}
variable "egress" {
  type    = list(object({
    description = string
    from_port  = number
    to_port    = number
    protocol   = string
    cidr_blocks = list(string)
  }))
}

variable "lb_name" {
  description = "The name of the load balancer"
  type        = string
}

variable "load_balancer_type" {
  description = "The type of the load balancer"
  type        = string
}

variable "internal" {
  description = "The type of the load balancer"
  type        = bool
}

variable "lb_port" {
  description = "The port of the listener"
  type        = string
}

variable "lb_protocol" {
  description = "The protocol of the listener"
  type        = string
}

variable "tg_port" {
  description = "The port of the listener"
  type        = string
}

variable "tg_protocol" {
  description = "The protocol of the listener"
  type        = string
}

variable "lb_type" {
  description = "The type of the listener"
  type        = string
}

variable "tg_name" {
  description = "The name of the target group"
  type        = string
}

variable "tg_type" {
  description = "The type of the target group"
  type        = string
}

variable "subnet_id_a" {
  description = "ID of the public subnet a"
  type        = string
}

variable "subnet_id_b" {
  description = "ID of the public subnet b"
  type        = string
}

variable "subnet_id_c" {
  description = "ID of the public subnet c"
  type        = string
}
