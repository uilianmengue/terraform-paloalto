output "management_eip" {
  description = "EIP for Management: "
  value       = aws_eip.management_eip.public_ip
}
