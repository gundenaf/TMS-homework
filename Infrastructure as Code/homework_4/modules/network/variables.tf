variable "name" {
  description = "The name to be used on all resources as identifier"
  type        = string
  default     = "my-vpc"
}

variable "cidr" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "az_a" {
  description = "The availability zone where the subnets will be created"
  type        = string
  default     = "us-east-1a"
}

variable "az_b" {
  description = "The availability zone where the subnets will be created"
  type        = string
  default     = "us-east-1b"
}

variable "az_c" {
  description = "The availability zone where the subnets will be created"
  type        = string
  default     = "us-east-1c"
}

variable "public_a_subnet_cidr" {
  description = "The CIDR block for the public subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "public_b_subnet_cidr" {
  description = "The CIDR block for the public subnet"
  type        = string
  default     = "10.0.2.0/24"
}

variable "public_c_subnet_cidr" {
  description = "The CIDR block for the public subnet"
  type        = string
  default     = "10.0.3.0/24"
}

variable "route_table_cidr" {
  description = "The CIDR block for the route table"
  type        = string
  default     = "0.0.0.0/0"
}

variable "enable_dns_hostnames" {
  description = "Should be true to enable DNS hostnames in the VPC"
  type        = bool
  default     = true
}

variable "enable_dns_support" {
  description = "Should be true to enable DNS support in the VPC"
  type        = bool
  default     = true
}
