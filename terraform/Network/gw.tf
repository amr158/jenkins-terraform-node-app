######public
resource "aws_internet_gateway" "IGW" {
    vpc_id =  aws_vpc.Main.id           
 }

 resource "aws_eip" "nateIP" {
   vpc   = true
 }

######private
 resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.nateIP.id
  subnet_id = aws_subnet.public_subnet_1.id
  tags = {
    "Name" = "${var.name}-nat_gateway"
  }
}