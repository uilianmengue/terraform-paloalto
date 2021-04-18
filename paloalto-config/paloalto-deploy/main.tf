# Configure the AWS Providers
provider "aws" {
  region = "us-east-1" # CloudFront expects ACM resources in us-east-1 region only
  access_key = "AKIAUCXM3GXYJWAIK5U4"
  secret_key = "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"
}

resource "aws_instance" "fw_01" {
  ami           = var.pa-ami
  instance_type = "m3.xlarge"
  availability_zone = aws_subnet.subnet_security.availability_zone
  key_name      = "AWS_personal"

  network_interface {
    network_interface_id = aws_network_interface.management.id
    device_index         = 0
  }
  network_interface {
    network_interface_id = aws_network_interface.lan_interface.id
    device_index         = 1
  }
  network_interface {
    network_interface_id = aws_network_interface.wan_interface.id
    device_index         = 2
  }
  root_block_device {
      encrypted             = true
      delete_on_termination = true
  }
  depends_on = [
      aws_network_interface.management,
      aws_vpc.vpc_pa,
      aws_subnet.subnet_security,
      aws_eip.management_eip
  ]
}




