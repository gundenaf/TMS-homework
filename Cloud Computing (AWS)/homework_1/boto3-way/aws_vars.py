#!/usr/bin/python3

# AWS credentials
aws_access_key_id = input("Input AWS Access Key ID: ")
aws_secret_access_key = input("Input AWS Secret Access Key: ")
#iam_user_arn = input("Input AWS User ARN: ")

# Assume Role configuration
assume_role_arn = input("Input ARN role: ")

# Specify the AWS region
region_name = "us-east-1"

# EC2 instance configuration
ec2_instance_type = "t2.micro"
ec2_ami_id = "ami-04cb4ca688797756f" # Amazon Linux 2023 AMI
ec2_security_group_name = "somegroup"
ec2_key_pair_name = "somekey"