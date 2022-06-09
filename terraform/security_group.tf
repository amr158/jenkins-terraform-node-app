resource "aws_security_group" "security_group_1" {
  name        = "${var.name}-security_group_1"
  vpc_id = module.network.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.name}-security_group_1"
  }
}


resource "aws_security_group" "security_group_2" {
  name        = "${var.name}-security_group_2"
  vpc_id = module.network.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [module.network.vpc_cidr]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = [module.network.vpc_cidr]
  }

  tags = {
    Name = "${var.name}-security_group_2"
  }
}

resource "aws_security_group_rule" "port_3000_rule" {
  type              = "ingress"
  from_port         = 3000
  to_port           = 3000
  protocol          = "tcp"
  cidr_blocks       = [module.network.vpc_cidr]
  security_group_id = aws_security_group.security_group_2.id
}

resource "aws_security_group" "DB-sgr" {
  name        = "DB-SG"
  description = "DB"
  vpc_id      = module.network.vpc-id

  ingress {
    description      = "Allow all"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = [module.network.vpc-cidr-block]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "${var.region}-SG-DB"
  }
}