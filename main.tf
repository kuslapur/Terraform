provider "aws" {
  region     = "ap-south-1"
  access_key = "AKIA32KN6KDRN5POC54X"
  secret_key = "gslMbUUF1x/BftStNKl6Km+Ar/JSdaw4Xr3hUSHO"
}

resource "aws_instance" "example" {
  ami                    = "ami-0c1a7f89451184c8b"
  instance_type          = "t2.micro"
  key_name               = "keypairaws"
  vpc_security_group_ids = ["sg-026e88b4c6f4f777d"]
  tags = {
    Name    = "Dove instance"
    Project = "Dove"
  }

}
