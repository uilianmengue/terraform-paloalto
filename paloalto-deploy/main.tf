# Configure the AWS Providers
provider "aws" {
  region = "us-east-1" # CloudFront expects ACM resources in us-east-1 region only
  access_key = "AKIAUCXM3GXYJWAIK5U4"
  secret_key = "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"
}

provider "panos" {
    hostname = aws_eip.management_eip.public_ip
    username = "uilian.mengue"
    password = "Hya567#2Jhs"
    timeout =  10
    logging =  ["action", "op", "uid"]
    verify_certificate = false
}

module "assets" {
    source = "./modules/"
}

resource "aws_route_table_association" "rt-security" {
  subnet_id      = aws_subnet.subnet_security.id
  route_table_id = aws_route_table.rt-security.id
}

resource "aws_main_route_table_association" "a" {
  vpc_id         = aws_vpc.vpc_pa.id
  route_table_id = aws_route_table.rt-main-security.id
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
  root_block_device {
      encrypted             = true
      delete_on_termination = true
  }
  provisioner "local-exec" {
    command = "echo $PANOS_HOSTNAME"
    environment = {
      PANOS_HOSTNAME = aws_eip.management_eip.public_ip
      PANOS_USERNAME = "uilian.mengue"
      PANOS_PASSWORD = "Hya567#2Jhs"
    }
  }

  depends_on = [
      aws_network_interface.management,
      aws_vpc.vpc_pa,
      aws_subnet.subnet_security,
      aws_eip.management_eip
  ]
}




