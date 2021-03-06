provider "aws" {
region     = "ap-south-1"

access_key = "xx"
secret_key = "xxxx"

}

resource "aws_vpc" "main" {
  cidr_block = "192.162.0.0/16"
  enable_dns_support = "1"
  enable_dns_hostnames = "1"

  tags = {
  Name = "My first VPC" 
  }
}

resource "aws_subnet" "first" {
	availability_zone =	"ap-south-1a"
	cidr_block		  = "192.162.0.0/16"
	map_public_ip_on_launch = "1"
	vpc_id = "${aws_vpc.main.id}"
	tags = {
	Name = "Myfirstsubnet"
   }
}


resource "aws_internet_gateway" "internet" {
	vpc_id = "${aws_vpc.main.id}"
	tags = {
	Name = "myinternetgateway"
	}
}

resource "aws_route" "internet" {
     route_table_id = "${aws_vpc.main.default_route_table_id}"
     destination_cidr_block = "0.0.0.0/0"
     gateway_id = "${aws_internet_gateway.internet.id}" 
}


resource "aws_route_table_association" "a" {
     subnet_id = "${aws_subnet.first.id}"
     route_table_id = "${aws_vpc.main.default_route_table_id}"
} 

resource "aws_default_security_group" "default_myfirst" {

 ingress {
	from_port = 0
	to_port = 0
	protocol = "-1"
	cidr_blocks = ["0.0.0.0/0"]
 }
 egress {
	from_port = 0
	to_port = 0
	protocol = "-1"
	cidr_blocks = ["0.0.0.0/0"]
 }
 vpc_id = "${aws_vpc.main.id}"
 tags = {
	 Name = "myfirstsecuritygroup"
	 }
}

resource "aws_network_interface" "first" {
 subnet_id = "${aws_subnet.first.id}"

 tags = {
 Name = "mynetworkinterface"
 }
}

resource "aws_instance" "Terraform" {
  
  ami = "ami-0567e0d2b4b2169ae"
  instance_type = "t2.micro"
  key_name= "project"
  subnet_id = "${aws_subnet.first.id}"
  
  tags = { 
       Name = "terraform_instance"
  }
}


resource "aws_network_interface_attachment" "connect" {
 instance_id = "${aws_instance.Terraform.id}"
 network_interface_id = "${aws_network_interface.first.id}"
 device_index = 1
}

