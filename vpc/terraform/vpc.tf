// vpc details
resource "aws_vpc" "main" {
  cidr_block	= var.vpc_cidr

  tags = {
    Name	= "Test vpc"
    Environment	= var.environment
    Contact	= var.contact 
  }
}

// Networking
resource "aws_subnet" "main" {
  vpc_id	= var.vpc_id
  cidr_block	= var.vpc_cidr

  tags = {
    Name = "VPC main subnet"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = "aws_vpc.default.id"

  tags = {
    name = "Test deploy net gw"
  }
}

resource "aws_default_route_table" "r" {
  default_route_table_id = "aws_vpc.main.default_route_table_id"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "aws_internet_gateway.gw.id"
  }
  tags = {
    Name = "default table"
  }
}

resource "aws_security_group"  "default" {
  name		= "PLM Sec Grp"
  description	= "Security group for test deployment"
  vpc_id	= "aws_vpc.main.id"

  ingress {
    from_port 	= 22
    to_port 	= 22
    protocol 	= "tcp"
    cidr_blocks = ["10.173.44.0/22"]
  }

  ingress {
    from_port 	= 80
    to_port 	= 80
    protocol 	= "tcp"
    cidr_blocks = ["10.173.44.0/22"]
  }

  egress {
    from_port = 0
    protocol = "-1"
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}
