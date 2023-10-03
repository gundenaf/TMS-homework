variable "vpc_cidr_block" {
  description = "CIDR block for EC2 VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
  default     = "dos_15_mikhalenka_vpc"
}

variable "subnet_cidr_block" {
  description = "CIDR block for the EC2 subnet"
  type        = string
  default     = "10.0.0.0/24"
}

variable "subnet_name" {
  description = "Name for the EC2 subnet"
  type        = string
  default     = "dos_15_mikhalenka_subnet"
}

variable "aws_az" {
  description = "Availability Zone for the EC2 subnet"
  type        = string
  default     = "us-east-1a"
}

variable "igw_name" {
  description = "Name for the Internet Gateway of the EC2 vpc"
  type        = string
  default     = "dos_15_mikhalenka_ig"
}

variable "rt_name" {
  description = "Name for the route table of the EC2 vpc"
  type        = string
  default     = "dos_15_mikhalenka_rt"
}
