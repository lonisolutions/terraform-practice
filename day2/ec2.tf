resource "aws_instance" "ec2" {
  ami           = "yolo ${count.index}"
  instance_type = "t2.micro"
  count         = 3
  tags = {
    "Name" : var.ec2names[count.index]
  }
}

output "ec2" {

  # value = [for instance in aws_instance.ec2 : instance.tags["Name"] ] --> this is a list
  value = { for instance in aws_instance.ec2 : instance.ami => instance.tags["Name"] } # --> this is key value pair
}