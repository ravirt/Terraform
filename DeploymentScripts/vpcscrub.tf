resource "aws_vpc_ipv4_cidr_block_association" "secondary_cidr" {
  vpc_id     = "vpc-0735064cce905ec76"
  cidr_block = "172.2.0.0/16"
}

resource "aws_subnet" "in_secondary_cidr" {
  vpc_id     = "vpc-0735064cce905ec76"
  cidr_block = "172.2.0.0/24"
}