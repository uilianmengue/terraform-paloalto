resource "aws_route_table" "rt-pa-mgn" {
  vpc_id = aws_vpc.vpc_pa.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ig-security.id
  }

  depends_on = [
      aws_vpc.vpc_pa
  ]
}

resource "aws_route_table_association" "rt-pa-mgn" {
  subnet_id      = aws_subnet.subnet_security_mgm.id
  route_table_id = aws_route_table.rt-pa-mgn.id
}

#########################

resource "aws_route_table" "rt-pa-lan" {
  vpc_id = aws_vpc.vpc_pa.id

  route {
    cidr_block = "0.0.0.0/0"
    network_interface_id = aws_network_interface.eni-pa-lan.id
  }
  route {
    cidr_block = "172.30.0.0/16"
    vpc_peering_connection_id = aws_vpc_peering_connection.pc-pa-resoure.id
  }

  depends_on = [
      aws_vpc.vpc_pa,
      aws_network_interface.eni-pa-lan
  ]
}

resource "aws_route_table_association" "rt-pa-lan" {
  subnet_id      = aws_subnet.subnet_security_lan.id
  route_table_id = aws_route_table.rt-pa-lan.id
}


#########################

resource "aws_route_table" "rt-pa-wan" {
  vpc_id = aws_vpc.vpc_pa.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ig-security.id
  }

  depends_on = [
      aws_vpc.vpc_pa
  ]
}

resource "aws_route_table_association" "rt-pa-wan" {
  subnet_id      = aws_subnet.subnet_security_wan.id
  route_table_id = aws_route_table.rt-pa-wan.id
}



#########################

resource "aws_route_table" "rt-resources" {
  vpc_id = aws_vpc.vpc_resources.id

  route {
    cidr_block = "0.0.0.0/0"
    vpc_peering_connection_id = aws_vpc_peering_connection.pc-pa-resoure.id
  }

  depends_on = [
      aws_vpc.vpc_resources
  ]
}

resource "aws_route_table_association" "rt-resources" {
  subnet_id      = aws_subnet.subnet_resources.id
  route_table_id = aws_route_table.rt-resources.id
}


#########################

resource "aws_route_table" "rt-main-security" {
  vpc_id = aws_vpc.vpc_pa.id

  depends_on = [
      aws_vpc.vpc_pa
  ]
}

resource "aws_route_table" "rt-main-resources" {
  vpc_id = aws_vpc.vpc_resources.id

  depends_on = [
      aws_vpc.vpc_resources
  ]
}

resource "aws_main_route_table_association" "main-rt-security" {
  vpc_id         = aws_vpc.vpc_pa.id
  route_table_id = aws_route_table.rt-main-security.id
}

resource "aws_main_route_table_association" "main-rt-resources" {
  vpc_id         = aws_vpc.vpc_resources.id
  route_table_id = aws_route_table.rt-main-resources.id
}