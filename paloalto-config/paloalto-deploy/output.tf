output "paloalto_management_address" {
  description = "Palo Alto Menagement Console: "
  value       = "https://${aws_eip.management_eip.public_ip}"
}
output "paloalto_ip_address" {
  description = "Palo Alto Menagement Console: "
  value       = aws_eip.management_eip.public_ip
}