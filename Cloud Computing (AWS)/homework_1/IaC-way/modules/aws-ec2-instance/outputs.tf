output "instance_id" {
  description = "ID of EC2 instance"
  value       = aws_instance.dos_15_mikhalenka_ec2.id
}

output "instance_public_ip" {
  description = "Public IP of EC2 instance"
  value       = aws_instance.dos_15_mikhalenka_ec2.public_ip
}
