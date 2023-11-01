provider "aws" {
  profile = "terraform_user"
}

resource "aws_eip" "terraform_eip" {
  domain = "vpc"
}

resource "aws_security_group" "terraform_sg" {
  name = "terraform_sg"
  ingress {
    description = "the input"
    from_port   = var.httpsport
    to_port     = var.httpsport
    protocol    = "tcp"
    cidr_blocks = ["${aws_eip.terraform_eip.public_ip}/32"]
  }

  egress {
    description      = "the output"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}
