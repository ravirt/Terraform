resource "aws_vpc_peering_connection" "test_peering" {
  peer_owner_id = "${var.peer_owner_id}"
  peer_vpc_id   = "${aws_vpc.primary.id}"
  vpc_id        = "${aws_vpc.secondary.id}"
  auto_accept = true 
}
