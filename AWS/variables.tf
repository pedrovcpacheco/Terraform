
variable "aws_region" {
  type = string
  default = "us-east-2"
  description = "Here we set the name or AWS Region"
}

variable "ssh_key_private" {
  default = ".pem"
}

variable  "user" {
  default = "ubuntu"
}

variable  "ami" {
  default = "ami-0454e5461ea6be876"
}
