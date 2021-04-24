output "paloalto_management_address" {
  description = "Palo Alto Menagement Console: "
  value       = "https://${aws_eip.eip-pa-mgm.public_ip}"
}