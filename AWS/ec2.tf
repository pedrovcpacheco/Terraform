resource "aws_instance" "web" {
  ami           = var.ami  
  instance_type = "t2.medium"
  key_name = "Project"
  vpc_security_group_ids = ["sg-01323a7b2574bff78"]
  count = 1


  tags = {
    Name = "Project-instance"
  }
}