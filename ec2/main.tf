provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "web-server" {
  ami           = "ami-00ca570c1b6d79f36" # Amazon Linux 2 AMI (HVM), SSD Volume Type
  instance_type = "t3.micro"
  tags = {
	Name = "ExampleInstance"
  }
}