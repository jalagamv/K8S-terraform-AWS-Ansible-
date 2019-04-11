provider "aws" {
  region     = "${var.region}"
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
}

terraform {
  backend "s3" {}
}

resource "aws_vpc" "production-vpc" {
  cidr_block            = "${var.vpc_cidr}"
  enable_dns_hostnames  = true

  tags {
    Name = "Production-VPC"
  }
}

resource "aws_subnet" "public-subnet-1" {
  cidr_block        = "${var.public_subnet_1_cidr}"
  vpc_id            = "${aws_vpc.production-vpc.id}"
  availability_zone = "us-east-2a"

  tags {
    Name = "Public-Subnet-1"
  }
}

resource "aws_route_table" "public-route-table" {
  vpc_id = "${aws_vpc.production-vpc.id}"

  tags {
    Name = "Public-Route-Table"
  }
}

resource "aws_route_table_association" "public-subnet-1-association" {
  route_table_id  = "${aws_route_table.public-route-table.id}"
  subnet_id       = "${aws_subnet.public-subnet-1.id}"
}


resource "aws_internet_gateway" "production-igw" {
  vpc_id = "${aws_vpc.production-vpc.id}"

  tags {
    Name = "Production-IGW"
  }
}

resource "aws_route" "public-internet-gw-route" {
  route_table_id          = "${aws_route_table.public-route-table.id}"
  gateway_id              = "${aws_internet_gateway.production-igw.id}"
  destination_cidr_block  = "0.0.0.0/0"
}