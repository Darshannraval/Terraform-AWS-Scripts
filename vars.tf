variable "aws_access_key" {}
variable "aws_secret_key" {}

variable "region" {
  default = "ap-south-1"
}

variable "vpc_cidr"{
 default = "10.1.0.0/16"
 description = "CIDR for the whole VPC"
}

variable "subnet_pri_2a"{
 default = "10.1.1.0/24"
 description = "CIDR for the Private Subnet in 2a AZ"
}
variable "subnet_pri_2b"{
 default = "10.1.2.0/24"
 description = "CIDR for the Private Subnet in 2b AZ"
}
variable "subnet_pri_2c"{
 default = "10.1.3.0/24"
 description = "CIDR for the Private Subnet in 2c AZ"
}
variable "subnet_pub_2a"{
 default = "10.1.4.0/24"
 description = "CIDR for the public Subnet in 2a AZ"
}
variable "subnet_pub_2b"{
 default = "10.1.5.0/24"
 description = "CIDR for the public Subnet in 2b AZ"
}
variable "subnet_pub_2c"{
 default = "10.1.6.0/24"
 description = "CIDR for the public Subnet in 2c AZ"
}

variable "destinationCIDRblock" {
        default = "0.0.0.0/0"
}



