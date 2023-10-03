terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.19.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

module "aws_ec2_vpc" {
  source = "./modules/aws-ec2-vpc"
}

module "aws_ec2_instance" {
  source            = "./modules/aws-ec2-instance"
  ec2_instance_type = var.ec2_instance_type
  vpc_id            = module.aws_ec2_vpc.vpc_id
  subnet_id         = module.aws_ec2_vpc.subnet_id
}
