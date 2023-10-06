variable "name" {
  description = "The name of the security group"
  type        = string
}

variable "description" {
  description = "The description of the security group"
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC in which to create the security group"
  type        = string
}

variable "ingress_from_port" {
  description = "The start port for ingress traffic"
  type        = number
}

variable "ingress_to_port" {
  description = "The end port for ingress traffic"
  type        = number
}

variable "egress_from_port" {
  description = "The start port for egress traffic"
  type        = number
}

variable "egress_to_port" {
  description = "The end port for egress traffic"
  type        = number
}

variable "protocol" {
  description = "The protocol for the ingress and egress rules"
  type        = string
}

variable "ingress_cidr_blocks" {
  description = "List of CIDR blocks to allow in ingress rules"
  type        = list(string)
}

variable "egress_cidr_blocks" {
  description = "List of CIDR blocks to allow in egress rules"
  type        = list(string)
}
