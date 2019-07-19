
// This is a script for custom VPC and creating one subnet and launching an instance into it.

provider "aws" {

  region = "us-east-2"
  access_key = ""
  secret_key = ""
}

resource "aws_security_group" "test" {
  vpc_id      = "${aws_vpc.myVPC.id}"
  name = "rt"
 
ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}

resource "aws_instance" "web" {
  ami  = "ami-0986c2ac728528ac2"
  instance_type = "t2.micro"
  subnet_id = "${aws_subnet.private-subnet.id}"
  vpc_security_group_ids = ["${aws_security_group.test.id}"]
  
  source_dest_check = false

  tags = {
    Name = "HelloWorld"
  }
}


resource "aws_vpc" "myVPC" {
  cidr_block       = "${var.vpc_cidr}"
  instance_tenancy = "default"

  tags = {
    Name = "devops"
  }
}

resource "aws_subnet" "private-subnet"{
   vpc_id      = "${aws_vpc.myVPC.id}"
   cidr_block = "${var.subnet_pri_2a}"

    tags = {
    Name = "private_2a"
  }
}

variable "vpc_cidr"{
 default = "10.1.0.0/16"
 description = "CIDR for the whole VPC"
}

variable "subnet_pri_2a"{
 default = "10.1.1.0/24"
 description = "CIDR for the Private Subnet in 2a AZ"
}







