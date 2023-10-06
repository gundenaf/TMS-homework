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

variable "from_port" {
  description = "The start port for the ingress and egress rules"
  type        = number
}

variable "to_port" {
  description = "The end port for the ingress and egress rules"
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
