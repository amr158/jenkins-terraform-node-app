data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

######public

resource "aws_instance" "bastion1" {
  instance_type = "t2.micro"
  ami = data.aws_ami.ubuntu.id
  subnet_id = module.network.pub_sub1_id
  security_groups = [aws_security_group.security_group_1.id]
  key_name = aws_key_pair.instance.key_name
  tags = {
    "Name" = "${var.name}-bastion1"
  }
  provisioner "local-exec" {
    command = "echo ${self.public_ip}"
  }
}



######private

resource "aws_instance" "application1" {
  instance_type = "t2.micro"
  ami = data.aws_ami.ubuntu.id
  subnet_id = module.network.pri_sub1_id
  security_groups = [aws_security_group.security_group_2.id]
  key_name = aws_key_pair.instance.key_name
  tags = {
    "Name" = "${var.name}-application1"
  }
}