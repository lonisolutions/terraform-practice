provider "aws" {
    profile = "terraform_user"
}

resource "aws_instance" "terraform-ec2" {
    ami = "ami-08f32efd140b7d89f"
    instance_type = "t2.micro"
    tags = {
      "Name" = "terraform-ec2"
    }
}