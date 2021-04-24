resource "aws_vpc_peering_connection" "pc-pa-resoure" {
  peer_vpc_id   = aws_vpc.vpc_resources.id
  vpc_id        = aws_vpc.vpc_pa.id
  auto_accept   = true
}