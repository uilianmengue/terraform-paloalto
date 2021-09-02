# Configure the AWS Providers
provider "aws" {
  region = "us-east-1" # CloudFront expects ACM resources in us-east-1 region only
  access_key = var.AWS_KEY
  secret_key = var.AWS_SECRET
}

/*resource "aws_instance" "fw_01" {
  ami           = var.pa-ami
  instance_type = "m4.xlarge"
  availability_zone = aws_subnet.subnet_security_mgm.availability_zone
  key_name      = "AWS_personal"

  network_interface {
    network_interface_id = aws_network_interface.eni-pa-management.id
    device_index         = 0
  }
  network_interface {
    network_interface_id = aws_network_interface.eni-pa-lan.id
    device_index         = 1
  }
  network_interface {
    network_interface_id = aws_network_interface.eni-pa-wan.id
    device_index         = 2
  }
  root_block_device {
      encrypted             = true
      delete_on_termination = true
  }
  depends_on = [
      aws_network_interface.eni-pa-management,
      aws_network_interface.eni-pa-lan,
      aws_network_interface.eni-pa-wan,
      aws_vpc.vpc_pa,
      aws_vpc.vpc_resources,
      aws_subnet.subnet_security_mgm,
      aws_subnet.subnet_security_lan,
      aws_subnet.subnet_security_wan,
      aws_eip.eip-pa-mgm,
      aws_eip.eip-pa-wan-one,
      aws_eip.eip-pa-wan-two
  ]
}*/

resource "aws_instance" "web_server" {
  ami           = var.web-server-ami
  instance_type = "t3.micro"
  availability_zone = aws_subnet.subnet_resources.availability_zone
  key_name      = "AWS_personal"

  network_interface {
    network_interface_id = aws_network_interface.ws_interface.id
    device_index         = 0
  }
  root_block_device {
      encrypted             = true
      delete_on_termination = true
  }
  depends_on = [
      #aws_network_interface.ws_interface,
      #aws_vpc.vpc_resources,
      #aws_subnet.subnet_resources,
      aws_security_group.sg-web-server
  ]
}
