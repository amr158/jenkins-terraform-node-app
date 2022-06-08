# resource "aws_db_parameter_group" "db_parameter_group_a" {
#   name   = "db-parameter-group-a"
#   family = "mysql8.0"

#   parameter {
#     name  = "character_set_server"
#     value = "utf8"
#   }

#   parameter {
#     name  = "character_set_client"
#     value = "utf8"
#   }
# }

# resource "aws_db_subnet_group" "db_subnet_group_a" {
#   name       = "db_subnet_group_a"
#   subnet_ids = [ module.network.pri_sub1_id ]

#   tags = {
#     Name = "My DB subnet group"
#   }
# }

# resource "aws_security_group" "rds-sg-a" {
#   name        = "rds_sg_a"
#   description = "allow inbound access to the database"
#   vpc_id      = module.network.vpc_id

#   ingress {
#     protocol    = "-1"
#     from_port   = 0
#     to_port     = 0
#     cidr_blocks = [ var.vpc_cidr ]
#   }

#   egress {
#     protocol    = "-1"
#     from_port   = 0
#     to_port     = 0
#     cidr_blocks = [ var.vpc_cidr ]
#   }
# }

# resource "aws_db_instance" "rds-db_instance_a" {
#   allocated_storage    = 100
#   storage_type         = "gp2"
#   engine               = "mysql"
#   engine_version       = "8.0"
#   instance_class       = "db.t2.micro"
#   identifier           = "db-instance-a"
#   db_name              = "mydb"
#   username             = "root"
#   password             = "12345678"
#   parameter_group_name = aws_db_parameter_group.db_parameter_group_a.id
#   db_subnet_group_name = aws_db_subnet_group.db_subnet_group_a.id
#   vpc_security_group_ids = [ aws_security_group.rds-sg-a.id ]
#   publicly_accessible  = false
#   skip_final_snapshot  = true
#   multi_az             = false
# }