resource "aws_internet_gateway" "ig-security" {
  vpc_id = aws_vpc.vpc_pa.id

  tags = {
    Name = "ig-security"
  }
}