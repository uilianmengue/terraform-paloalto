data "http" "myip" {
  url = "http://ipv4.icanhazip.com"
}

resource "aws_security_group" "sg-pa-mgm" {
  name        = "pa-mgm"
  description = "Allow traffic for Palo Alto"
  vpc_id      = aws_vpc.vpc_pa.id
  
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
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

resource "aws_security_group" "sg-pa-interfaces" {
  name        = "pa-interfaces"
  description = "Allow traffic for Palo Alto"
  vpc_id      = aws_vpc.vpc_pa.id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "sg-pa-interfaces"
  }
}

resource "aws_security_group" "sg-web-server" {
  name        = "web-server"
  description = "Allow traffic for Palo Alto"
  vpc_id      = aws_vpc.vpc_resources.id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "sg-web-server"
  }
}