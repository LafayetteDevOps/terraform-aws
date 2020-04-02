// IaC main.tf

resource "aws_key_pair" "key" {
  public_key = file("~/.ssh/aws_key.pub")
}

resource "aws_instance" "multiple" {
  ami           = "ami-0fc61db8544a617ed"
  instance_type = var.type
  key_name	= aws_key_pair.key.key_name
  count =2

  tags = {
    Name = "Terraform t2.micro instance-${count.index +1}"
  }
}
