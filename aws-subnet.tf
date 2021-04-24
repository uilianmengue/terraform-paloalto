resource "aws_subnet" "subnet_security_mgm" {
  vpc_id     = aws_vpc.vpc_pa.id
  cidr_block = "172.20.0.0/24"
  availability_zone= "us-east-1b"

  tags = {
    Name = "subnet_security_mgm"
  }
  depends_on = [
      aws_vpc.vpc_pa,
  ]
}
resource "aws_subnet" "subnet_security_lan" {
  vpc_id            = aws_vpc.vpc_pa.id
  cidr_block = "172.20.1.0/24"
  availability_zone= "us-east-1b"

  tags = {
    Name = "subnet_security_lan"
  }
  depends_on = [
      aws_vpc.vpc_pa,
  ]
}

resource "aws_subnet" "subnet_security_wan" {
  vpc_id            = aws_vpc.vpc_pa.id
  cidr_block = "172.20.2.0/24"
  availability_zone= "us-east-1b"

  tags = {
    Name = "subnet_security_wan"
  }
  depends_on = [
      aws_vpc.vpc_pa,
  ]
}

resource "aws_subnet" "subnet_resources" {
  vpc_id     = aws_vpc.vpc_resources.id
  cidr_block = aws_vpc.vpc_resources.cidr_block
  availability_zone= "us-east-1b"

  tags = {
    Name = "subnet_resources"
  }
  depends_on = [
      aws_vpc.vpc_resources,
  ]
}