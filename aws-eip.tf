resource "aws_eip" "eip-pa-mgm" {
  network_interface = aws_network_interface.eni-pa-management.id
  associate_with_private_ip = aws_network_interface.eni-pa-management.private_ip
  vpc      = true
  depends_on = [
      aws_network_interface.eni-pa-management,
  ]
}

resource "aws_eip" "eip-pa-wan" {
  network_interface = aws_network_interface.eni-pa-wan.id
  associate_with_private_ip = aws_network_interface.eni-pa-wan.private_ip
  vpc      = true
  depends_on = [
      aws_network_interface.eni-pa-wan,
  ]
}