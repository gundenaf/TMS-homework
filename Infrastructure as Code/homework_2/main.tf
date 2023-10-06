module "network" {
  source = "./modules/network"

  name = "dos_15_mikhalenka_vpc"
  cidr = "10.0.0.0/16"
  az   = "us-east-1a"

  public_subnet_cidr  = "10.0.1.0/24"
  private_subnet_cidr = "10.0.2.0/24"

  enable_dns_hostnames = true
  enable_dns_support   = true
}

module "security" {
  source = "./modules/security"

  name        = "dos_15_mikhalenka_sg"
  description = "This is my security group"
  
  vpc_id = module.network.vpc_id

  ingress_from_port   = 22
  ingress_to_port     = 22
  egress_from_port    = 57385
  egress_to_port      = 57385
  protocol    = "tcp"

  ingress_cidr_blocks = ["0.0.0.0/0"]
  egress_cidr_blocks  = ["0.0.0.0/0"]
}

module "compute" {
  source = "./modules/compute"

  name        = "dos_15_mikhalenka_ec2"
  instance_type = "t2.micro"
  
  key_name    = "DOS_15_Mikhalenka"
  
  subnet_id   = module.network.public_subnet_id
  security_group_id = module.security.security_group_id
  
  volume_size = 8
  volume_type = "gp2"
  
  associate_public_ip_address = true
}