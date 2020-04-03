
// IaC main.tf

resource "aws_key_pair" "key" {
  public_key = file("~/.ssh/aws_key.pub")
}

resource "aws_instance" "ec2 instance" {
  ami 		= "ami-0fc61db8544a617ed"
  instance_type	= "t2.micro"
  key_name	= aws_key_pair.key.key_name

  tags = {
    Name = "t2.micro instance-${count.index +1}"
  }
}
