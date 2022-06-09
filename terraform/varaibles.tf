variable "name" {
  type = string
}

variable "vpc_cidr" {
  type = string
}

variable "public_subnet_1_cidr" {
  type = string
}


variable "private_Subnet_1_cidr" {
  type = string
}

variable "private_subnet_2_cidr" {
  type = string
}


variable "region" {
  type = string
}

variable "ami" {
  type = string
}

variable db_Pass{
type  = string

}

variable db_User {
  type  = string

}