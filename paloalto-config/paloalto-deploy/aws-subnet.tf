resource "aws_subnet" "subnet_security" {
  vpc_id            = aws_vpc.vpc_pa.id
  cidr_block = aws_vpc.vpc_pa.cidr_block
  availability_zone= "us-east-1b"

  tags = {
    Name = "subnet_security"
  }
  depends_on = [
      aws_vpc.vpc_pa,
  ]
}