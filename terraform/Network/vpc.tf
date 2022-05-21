resource "aws_vpc" "Main" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "${var.name}-main"
  }
  instance_tenancy = "default"
  enable_dns_hostnames = "true"
}