// IaC main.tf

resource "aws_instance" "single_instance" {
  ami 		= "ami-0fc61db8544a617ed"
  instance_type	= "t2.micro"

  tags = { 
    Name = "t2.micro instance"
  }
}
