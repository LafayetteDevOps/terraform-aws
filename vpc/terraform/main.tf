
// IaC main.tf

resource "aws_key_pair" "key" {
  public_key = file("~/.ssh/aws_key.pub")
}

resource "aws_instance" "ec2_nano_instance" {
  ami           = var.al2_ami_id
  instance_type = "t2.nano"
  count = 1
  key_name      = aws_key_pair.key.key_name

  tags = {
    Name = "t2.nano instance-${count.index +1}"
  }
}

resource "aws_instance" "ec2_micro_instance" {
  ami 		= var.al2_ami_id
  instance_type	= var.type
  count = 1
  key_name	= aws_key_pair.key.key_name

  tags = {
    Name = "t2.micro instance-${count.index +1}"
  }
}

resource "aws_instance" "ec2_small_instance" {
  ami           = var.al2_ami_id
  instance_type = "t2.small"
  count = 1
  key_name      = aws_key_pair.key.key_name

  tags = {
    Name = "t2.small instance-${count.index +1}"
  }
}
