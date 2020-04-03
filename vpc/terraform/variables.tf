// IaC deployment variables

variable "aws_region" {
  type          = string
  default       = "us-east-1"
}

variable "type" {
  description = "instance type"
  type = string
  default = "t2.micro"
}

variable "vpc_cidr" {
  description   = "cidr block"
  type          = string
  default       = " "
}

variable "vpc_id" {
  description   = "vpc_id"
  type        = string
  default       = " "
}
