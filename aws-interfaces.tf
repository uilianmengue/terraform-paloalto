resource "aws_network_interface" "eni-pa-management" {
  subnet_id   = aws_subnet.subnet_security_mgm.id
  security_groups = [aws_security_group.sg-pa-mgm.id]
  tags = {
    Name = "management"
  }
  depends_on = [
      aws_subnet.subnet_security_mgm,
      aws_security_group.sg-pa-mgm
  ]
}
resource "aws_network_interface" "eni-pa-lan" {
  subnet_id   = aws_subnet.subnet_security_lan.id
  security_groups = [aws_security_group.sg-pa-interfaces.id]
  source_dest_check = false
  private_ips = ["172.20.1.10"]
  tags = {
    Name = "PA_Lan_Interface"
  }
  depends_on = [
      aws_subnet.subnet_security_lan,
      aws_security_group.sg-pa-interfaces
  ]
}

resource "aws_network_interface" "eni-pa-wan" {
  subnet_id   = aws_subnet.subnet_security_wan.id
  security_groups = [aws_security_group.sg-pa-interfaces.id]
  source_dest_check = false
  private_ips = ["172.20.2.11", "172.20.2.10"]
  tags = {
    Name = "PA_Wan_Interface"
  }
  depends_on = [
      aws_subnet.subnet_security_wan,
      aws_security_group.sg-pa-interfaces
  ]
}

resource "aws_network_interface" "ws_interface" {
  subnet_id   = aws_subnet.subnet_resources.id
  security_groups = [aws_security_group.sg-web-server.id]
  tags = {
    Name = "WebServer"
  }
  depends_on = [
      aws_subnet.subnet_resources,
      aws_security_group.sg-web-server
  ]
}