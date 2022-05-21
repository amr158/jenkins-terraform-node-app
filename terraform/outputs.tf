output "bastion1-ip" {
    value = aws_instance.bastion1.public_ip
}
output "bastion2-ip" {
    value = aws_instance.bastion2.public_ip
}
