output "management_eip" {
  description = "EIP for Management: "
  value       = aws_eip.management_eip.public_ip
}
#output "instance_count" {
#  description = "Number of instances to launch specified as argument to this module"
#  value       = var.instance_count
#}