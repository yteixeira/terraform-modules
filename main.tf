provider "aws" {
  region  = "eu-west-1"
}

# create a vpc
resource "aws_vpc" "app" {
  cidr_block = "${var.cidr_block}"

  tags = {
    Name = "${var.name}-terraform-modules"
  }
}

# internet gateway
resource "aws_internet_gateway" "app" {
  vpc_id = "${aws_vpc.app.id}"

  tags = {
    Name = "${var.name}"
  }
}

# APP
# create a subnet
module "app" {
  source = "./app_tier"
  vpc_id = "${aws_vpc.app.id}"
  name = "${var.name}"
  gateway_id = "${aws_internet_gateway.app.id}"
  db_private_ip = "${module.db.db_private_ip}"
  app_ami_id = "${var.app_ami_id}"
}


# DB
# create a subnet
module "db" {
  source = "./db_tier"
  vpc_id = "${aws_vpc.app.id}"
  name = "${var.name}"
  app_security_id = "${module.app.app_security_id}"
  app_subnet_cidr = "${module.app.app_subnet_cidr}"
  db_ami_id = "${var.db_ami_id}"
}
