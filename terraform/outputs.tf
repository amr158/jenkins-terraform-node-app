output "bastion1-ip" {
    value = aws_instance.bastion1.public_ip
}

output "private-ip" {
  value = aws_instance.application1.private_ip
}