variable "vpc_id" {
  description = "pass the vpc id to db tier"
}

variable "name" {
  description = "pass the name to db tier"
}

variable "app_security_id" {
  description = "pass the app security group id to the db tier"
}

variable "app_subnet_cidr" {
  description = "pass the stuff bruv"
}

variable "db_ami_id" {
  description = "ami id"
}
