data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

resource "aws_security_group" "dos_15_mikhalenka_sg" {
  name        = var.ec2_security_group_name
  description = var.ec2_security_group_description
  vpc_id      = var.vpc_id

  ingress {
    description      = "Allow SSH traffic from everywhere"
    from_port        = 22
    to_port          = 39853
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = var.ec2_security_group_name
  }
}

resource "aws_instance" "dos_15_mikhalenka_ec2" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = var.ec2_instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [aws_security_group.dos_15_mikhalenka_sg.id]

  tags = {
    Name = var.ec2_instance_name
  }
}
