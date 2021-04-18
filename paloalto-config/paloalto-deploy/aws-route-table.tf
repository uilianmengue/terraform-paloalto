resource "aws_route_table" "rt-security" {
  vpc_id = aws_vpc.vpc_pa.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ig-security.id
  }

  tags = {
    Name = "rt-security"
  }

  depends_on = [
      aws_internet_gateway.ig-security,
      aws_vpc.vpc_pa
  ]
}

resource "aws_route_table" "rt-main-security" {
  vpc_id = aws_vpc.vpc_pa.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ig-security.id
  }

  tags = {
    Name = "rt-main-security"
  }

  depends_on = [
      aws_internet_gateway.ig-security,
      aws_vpc.vpc_pa
  ]
}

resource "aws_route_table_association" "rt-security" {
  subnet_id      = aws_subnet.subnet_security.id
  route_table_id = aws_route_table.rt-security.id
}

resource "aws_main_route_table_association" "main-rt-security" {
  vpc_id         = aws_vpc.vpc_pa.id
  route_table_id = aws_route_table.rt-main-security.id
}
