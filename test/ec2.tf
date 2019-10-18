resource "aws_instance" "Ravi_Terraform" {
  ami           = "ami-00eb20669e0990cb4"
  instance_type = "t2.micro"
  subnet_id = "${aws_subnet.primary-az1.id}"
  vpc_security_group_ids = ["${aws_security_group.primary-default.id}"]
}