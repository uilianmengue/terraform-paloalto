resource "aws_eip" "management_eip" {
  network_interface = aws_network_interface.management.id
  associate_with_private_ip = aws_network_interface.management.private_ip
  vpc      = true
  depends_on = [
      aws_network_interface.management,
  ]
}