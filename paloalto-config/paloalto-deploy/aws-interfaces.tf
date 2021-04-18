resource "aws_network_interface" "management" {
  subnet_id   = aws_subnet.subnet_security.id
  security_groups = [aws_security_group.pa-security.id]
  tags = {
    Name = "management"
  }
  depends_on = [
      aws_subnet.subnet_security,
      aws_security_group.pa-security
  ]
}
resource "aws_network_interface" "lan_interface" {
  subnet_id   = aws_subnet.subnet_security.id
  security_groups = [aws_security_group.pa-security.id]
  tags = {
    Name = "PA_Lan_Interface"
  }
  depends_on = [
      aws_subnet.subnet_security,
      aws_security_group.pa-security
  ]
}

resource "aws_network_interface" "wan_interface" {
  subnet_id   = aws_subnet.subnet_security.id
  security_groups = [aws_security_group.pa-security.id]
  tags = {
    Name = "PA_Wan_Interface"
  }
  depends_on = [
      aws_subnet.subnet_security,
      aws_security_group.pa-security
  ]
}