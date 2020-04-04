// IaC deployment variables

variable "contact" {
  default = "Chris"
}

variable "aws_region" {
  type          = string
  default       = "us-east-1"
}

variable "type" {
  description = "instance type"
  type = string
  default = "t2.micro"
}

variable "al2_ami_id" {
  default = "ami-0fc61db8544a617ed"
}

variable "environment" {
  default = "development"
}

variable "vpc_cidr" {
  description   = "cidr block"
  type          = string
  default       = "172.16.0.0/16"
}

variable "vpc_id" {
  description   = "vpc_id"
  type        = string
  default       = " "
}
