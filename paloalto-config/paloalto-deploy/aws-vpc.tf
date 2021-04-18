resource "aws_vpc" "vpc_pa" {
  cidr_block = "172.20.0.0/16"

  tags = {
    Name = "vpc_pa"
  }
}