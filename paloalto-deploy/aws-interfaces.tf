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