######public

resource "aws_instance" "bastion1" {
  instance_type = "t2.micro"
  ami = var.ami #"ami-08ca3fed11864d6bb" (Ubuntu)
  subnet_id = module.network.pub_sub1_id
  security_groups = [aws_security_group.security_group_1.id]
  key_name = aws_key_pair.instance.key_name
  tags = {
    "Name" = "${var.name}-bastion1"
  }
  
}



######private

resource "aws_instance" "application1" {
  instance_type = "t2.micro"
  ami = var.ami # (Ubuntu)
  subnet_id = module.network.pri_sub1_id
  security_groups = [aws_security_group.security_group_2.id]
  key_name = aws_key_pair.instance.key_name
  tags = {
    "Name" = "${var.name}-application1"
  }
}
