resource "aws_db_subnet_group" "db_subnet_group" {
  name       = "subnet-group"
  subnet_ids = [module.network.pri_sub1_id,module.network.pri_sub2_id]
}

resource "aws_db_instance" "rds" {
  allocated_storage    = 10
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  db_name                 = "mydb"
  username             = var.db_User
  password             = var.db_Pass  # ---> should be variable
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
  db_subnet_group_name    = aws_db_subnet_group.db_subnet_group.name
  vpc_security_group_ids = [aws_security_group.DB-sgr.id]
}