variable "ec2_instance_name" {
  description = "Name for EC2 instance"
  type        = string
  default     = "dos_15_mikhalenka_ec2"
}

variable "ec2_instance_type" {
  description = "Instance type for EC2 instance"
  type        = string
  default     = "t2.micro"
}

variable "ec2_security_group_name" {
  description = "Security group name for EC2 instance"
  type        = string
  default     = "dos_15_mikhalenka_sg"
}

variable "ec2_security_group_description" {
  description = "Security group description for EC2 instance"
  type        = string
  default     = "Allow SSH traffic"
}

variable "vpc_id" {
  description = "VPC id for EC2 instance"
  type        = string
}

variable "subnet_id" {
  description = "Subnet id for EC2 instance"
  type        = string
}
