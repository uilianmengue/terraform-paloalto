resource "aws_vpc" "vpc_pa" {
  cidr_block = "10.100.0.0/16"

  tags = {
    Name = "vpc_pa"
  }
}

resource "aws_vpc" "vpc_resources" {
  cidr_block = "172.30.0.0/16"

  tags = {
    Name = "vpc_resources"
  }
}