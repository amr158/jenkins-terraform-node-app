output pub_sub1_id {
    value = aws_subnet.public_subnet_1.id
}
output pri_sub1_id {
    value = aws_subnet.private_subnet_1.id
}
output vpc_id {
    value = aws_vpc.Main.id
}
output vpc_cidr {
    value = aws_vpc.Main.cidr_block
}