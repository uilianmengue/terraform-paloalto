resource "aws_eip" "eip-pa-mgm" {
  network_interface = aws_network_interface.eni-pa-management.id
  associate_with_private_ip = aws_network_interface.eni-pa-management.private_ip
  vpc      = true
  depends_on = [
      aws_network_interface.eni-pa-management,
  ]
}

resource "aws_eip" "eip-pa-wan-one" {
  network_interface = aws_network_interface.eni-pa-wan.id
  associate_with_private_ip = "172.20.2.10"
  vpc = true
  depends_on = [
      aws_network_interface.eni-pa-wan,
  ]
}

resource "aws_eip" "eip-pa-wan-two" {
  network_interface = aws_network_interface.eni-pa-wan.id
  associate_with_private_ip = "172.20.2.11"
  vpc = true
  depends_on = [
      aws_network_interface.eni-pa-wan,
  ]
}