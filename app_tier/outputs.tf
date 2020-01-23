output app_security_id {
  value = "${aws_security_group.app.id}"
}

output app_subnet_cidr {
  value = "${aws_subnet.app.cidr_block}"
}
