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

resource "aws_internet_gateway" "gw" {
  vpc_id = "${aws_vpc.myVPC.id}"

  tags = {
    Name = "devopsIGW"
  }
}

resource "aws_eip" "nat" {
  vpc      = true
  depends_on = ["aws_internet_gateway.gw"]
}

resource "aws_nat_gateway" "privatenat" {
  allocation_id = "${aws_eip.nat.id}"
  subnet_id     = "${aws_subnet.Public_2a.id}"

  tags = {
    Name = "devopsNAT"
  }
}


resource "aws_route_table" "r" {
  vpc_id = "${aws_vpc.myVPC.id}"

  route {
    cidr_block = "${var.destinationCIDRblock}"
    gateway_id = "${aws_internet_gateway.gw.id}"
  }

 tags = {
    Name = "devopspublicRT"
  }
}

resource "aws_default_route_table" "rpri" {
  default_route_table_id = "${aws_vpc.myVPC.default_route_table_id}"

  route {
    cidr_block = "${var.destinationCIDRblock}"
    gateway_id = "${aws_nat_gateway.privatenat.id}"
  }

  tags = {
    Name = "devopsprivateRT"
  }
}


resource "aws_route_table_association" "assoc-pub2a" {
   subnet_id      = "${aws_subnet.Public_2a.id}"
   route_table_id = "${aws_route_table.r.id}"
}
resource "aws_route_table_association" "assoc-pub2b" {
   subnet_id      = "${aws_subnet.Public_2b.id}"
   route_table_id = "${aws_route_table.r.id}"
}

resource "aws_route_table_association" "assoc-pub2c" {
   subnet_id      = "${aws_subnet.Public_2c.id}"
   route_table_id = "${aws_route_table.r.id}"
}

resource "aws_route_table_association" "assoc-pri2a" {
   
   subnet_id      = "${aws_subnet.Private_2a.id}"
   route_table_id = "${aws_default_route_table.rpri.id}"
   
}
resource "aws_route_table_association" "assoc-pri2b" {
   
   subnet_id      = "${aws_subnet.Private_2b.id}"
   route_table_id = "${aws_default_route_table.rpri.id}"
   
}
resource "aws_route_table_association" "assoc-pri2c" {
   
   subnet_id      = "${aws_subnet.Private_2c.id}"
   route_table_id = "${aws_default_route_table.rpri.id}"
  
}







