######public subnets
resource "aws_subnet" "public_subnet_1" {
  vpc_id     = aws_vpc.Main.id
  cidr_block = var.public_subnet_1_cidr
  availability_zone = "${var.region}a"
  map_public_ip_on_launch = "true"
  tags = {
    Name = "${var.name}-Public_Subnet_1"
  }
}

resource "aws_route_table_association" "public_subnet_1_route_table_association" {
    subnet_id = aws_subnet.public_subnet_1.id
    route_table_id = aws_route_table.public_route_table.id
}



######private subnets
resource "aws_subnet" "private_subnet_1" {
  vpc_id     = aws_vpc.Main.id
  cidr_block = var.private_Subnet_1_cidr
  availability_zone = "${var.region}a"
  tags = {
    Name = "${var.name}-private_Subnet_1"
  }
}

resource "aws_route_table_association" "private_subnet_1_route_table_association" {
    subnet_id = aws_subnet.private_subnet_1.id
    route_table_id = aws_route_table.private_route_table.id
}

