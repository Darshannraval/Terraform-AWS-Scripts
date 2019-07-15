provider "aws" {
    access_key = "${var.aws_access_key}"
    secret_key = "${var.aws_secret_key}"
    region = "${var.region}"
}


resource "aws_vpc" "myVPC" {
  cidr_block       = "${var.vpc_cidr}"
  instance_tenancy = "default"

  tags = {
    Name = "devops"
  }
}

resource "aws_subnet" "Private_2a"{
   vpc_id = "${aws_vpc.myVPC.id}"
   cidr_block = "${var.subnet_pri_2a}"

    tags = {
    Name = "private_2a"
  }
}

resource "aws_subnet" "Private_2b"{
   vpc_id = "${aws_vpc.myVPC.id}"
   cidr_block = "${var.subnet_pri_2b}"

    tags = {
    Name = "private_2b"
  }
}

resource "aws_subnet" "Private_2c"{
   vpc_id = "${aws_vpc.myVPC.id}"
   cidr_block = "${var.subnet_pri_2c}"

    tags = {
    Name = "private_2c"
  }
}

resource "aws_subnet" "Public_2a"{
   vpc_id = "${aws_vpc.myVPC.id}"
   cidr_block = "${var.subnet_pub_2a}"

    tags = {
    Name = "Public_2a"
  }
}
resource "aws_subnet" "Public_2b"{
   vpc_id = "${aws_vpc.myVPC.id}"
   cidr_block = "${var.subnet_pub_2b}"

    tags = {
    Name = "Public_2b"
  }
}

resource "aws_subnet" "Public_2c"{
   vpc_id = "${aws_vpc.myVPC.id}"
   cidr_block = "${var.subnet_pub_2c}"

    tags = {
    Name = "Public_2c"
  }
}

/*resource "aws_internet_gateway" "gw" {
  vpc_id = "${aws_vpc.vpc.id}"

  tags = {
    Name = "myIGW"
  }
}

resource "aws_route_table" "r" {
  vpc_id = "${aws_vpc.vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.gw.id}"
  }

 tags = {
    Name = "myRT"
  }
}*/






