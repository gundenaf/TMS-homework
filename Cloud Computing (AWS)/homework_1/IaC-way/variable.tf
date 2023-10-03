variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "ec2_instance_type" {
  description = "Instance type for EC2 instances"
  type        = string
  default     = "t2.micro"
}

variable "aws_access_key" {}

variable "aws_secret_key" {}