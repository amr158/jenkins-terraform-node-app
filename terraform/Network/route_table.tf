######public

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.Main.id
  tags = {
    Name = "${var.name}-public_route_table"
  }
}

resource "aws_route" "public_route" {
  route_table_id            = aws_route_table.public_route_table.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id            = aws_internet_gateway.IGW.id
}

######private
resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.Main.id
  tags = {
    Name = "${var.name}-private_route_table"
  }
}
resource "aws_route" "private_route" {
  route_table_id            = aws_route_table.private_route_table.id
  destination_cidr_block    = "0.0.0.0/0"
  nat_gateway_id            = aws_nat_gateway.nat_gateway.id
}