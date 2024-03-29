resource "aws_vpc_endpoint" "ec2" {
  vpc_id            = "${aws_vpc.primary.id}"
  service_name      = "com.amazonaws.us-east-1.ec2"
  vpc_endpoint_type = "Interface"
  security_group_ids = [
    "${aws_security_group.primary-default.id}",
  ]
  private_dns_enabled = true
}