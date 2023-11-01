variable "ports" {
  type    = list(number)
  default = [88, 443, 8080]
}

resource "aws_security_group" "dynamicsg" {

  name        = "terraform_sg"
  description = "the input"
  dynamic "ingress" {

    for_each = var.ports
    iterator = port
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/32"]

    }
  }
}