resource "aws_key_pair" "mykeypair" {
  key_name = "awskeydatabase-${var.ENV}"
  public_key = "${file(var.path_to_public_key)}"
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}


resource "aws_instance" "private_instance" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  key_name = aws_key_pair.mykeypair.key_name

  tags = {
    Name = "private instance"
  }

    # The VPC Subnet
  subnet_id = element(var.private-subnets, 1)

    # Security Group
  vpc_security_group_ids = [aws_security_group.mongodb_security_group.id]
  availability_zone = "eu-west-1b"
}