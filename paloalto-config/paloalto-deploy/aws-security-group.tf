data "http" "myip" {
  url = "http://ipv4.icanhazip.com"
}

resource "aws_security_group" "pa-security" {
  name        = "pa-security"
  description = "Allow traffic for Palo Alto"
  vpc_id      = aws_vpc.vpc_pa.id

  ingress {
    description = "HTTPS to my IP"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["${chomp(data.http.myip.body)}/32"]
  }
  
  ingress {
    description = "SSH to my IP"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${chomp(data.http.myip.body)}/32"]
  }

  ingress {
    description = "ICMP to my IP"
    from_port   = 8
    to_port     = 0
    protocol    = "icmp"
    cidr_blocks = ["${chomp(data.http.myip.body)}/32"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "pa-security"
  }
}