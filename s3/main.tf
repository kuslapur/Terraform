provider "aws" {
  region = "ap-south-1"
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "bkuslapur-123456"
  acl    = "private"
  tags = {
	Name        = "My bucket"
	Environment = "Dev"
  }
}
   