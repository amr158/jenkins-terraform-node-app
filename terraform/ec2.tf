######public

resource "aws_instance" "bastion1" {
  instance_type = "t2.micro"
  ami = var.ami #"ami-08ca3fed11864d6bb" (Ubuntu)
  subnet_id = module.network.pub_sub1_id
  security_groups = [aws_security_group.security_group_1.id]
  key_name = aws_key_pair.instance.key_name
  disable_api_termination = false
  ebs_optimized = false
  root_block_device {
    volume_size = "10"
  }
  tags = {
    "Name" = "${var.name}-bastion1"
  }
  provisioner "local-exec" {
    command = "echo ${self.public_ip}"
  }
}

resource "aws_instance" "bastion2" {
  instance_type = "t2.micro"
  ami = var.ami # (Ubuntu)
  subnet_id = module.network.pub_sub2_id
  security_groups = [aws_security_group.security_group_1.id]
  key_name = aws_key_pair.instance.key_name
  disable_api_termination = false
  ebs_optimized = false
  root_block_device {
    volume_size = "10"
  }
  tags = {
    "Name" = "${var.name}-bastion2"
  }
  provisioner "local-exec" {
    command = "echo ${self.public_ip}"
  }
}



######private

resource "aws_instance" "application1" {
  instance_type = "t2.micro"
  ami = var.ami # (Ubuntu)
  subnet_id = module.network.pri_sub1_id
  security_groups = [aws_security_group.security_group_2.id]
  key_name = aws_key_pair.instance.key_name
  disable_api_termination = false
  ebs_optimized = false
  root_block_device {
    volume_size = "10"
  }
  tags = {
    "Name" = "${var.name}-application1"
  }
}

resource "aws_instance" "application2" {
  instance_type = "t2.micro"
  ami = var.ami # (Ubuntu)
  subnet_id = module.network.pri_sub2_id
  security_groups = [aws_security_group.security_group_2.id]
  key_name = aws_key_pair.instance.key_name
  disable_api_termination = false
  ebs_optimized = false
  root_block_device {
    volume_size = "10"
  }
  tags = {
    "Name" = "${var.name}-application2"
  }
}