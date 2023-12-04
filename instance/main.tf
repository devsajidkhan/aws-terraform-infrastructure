variable "subnet_id" {}
variable "security_group_ids" {}

resource "aws_instance" "example_instance" {
  ami                    = "ami-0230bd60aa48260c6"
  instance_type          = "t2.micro"
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.security_group_ids  # Correct attribute name

  tags = {
    Name = "ExampleInstance"
  }
}

