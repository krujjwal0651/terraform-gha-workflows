# Bastion Host outputs

output "bastion_public_ip" {
  description = "Public IP address of the bastion host"
  value       = aws_instance.bastion_host_1.public_ip
}

output "bastion_private_ip" {
  description = "Private IP address of the bastion host"
  value       = aws_instance.bastion_host_1.private_ip
}

output "bastion_dns_name" {
  description = "Public DNS name of the bastion host"
  value       = aws_instance.bastion_host_1.public_dns
}
