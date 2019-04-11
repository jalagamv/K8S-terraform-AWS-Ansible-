
variable "aws_access_key" {}

variable "aws_secret_key" {}

variable "private_key_path" {}

variable "key_name" {
  default = "hezkeypair"
}

variable "region" {
  default     = "us-east-2"
  description = "AWS Region"
}

variable "vpc_cidr" {
  default     = "10.88.0.0/16"
  description = "VPC CIDR Block"
}

variable "public_subnet_1_cidr" {
  description = "Public Subnet 1 CIDR"
}

variable "public_subnet_2_cidr" {
  description = "Public Subnet 2 CIDR"
}

variable "public_subnet_3_cidr" {
  description = "Public Subnet 3 CIDR"
}

variable "private_subnet_1_cidr" {
  description = "Private Subnet 1 CIDR"
}

variable "private_subnet_2_cidr" {
  description = "Private Subnet 2 CIDR"
}

variable "private_subnet_3_cidr" {
  description = "Private Subnet 3 CIDR"
}