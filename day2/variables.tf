variable "httpsport" {
  type = number
}

variable "ec2names" {
  type    = list(string)
  default = ["prod", "dev", "stage"]

}