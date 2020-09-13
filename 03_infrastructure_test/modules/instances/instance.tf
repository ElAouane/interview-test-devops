resource "aws_key_pair" "mykeypair" {
  key_name = "awskey-${var.ENV}"
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

resource "aws_instance" "public_instance" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  key_name = aws_key_pair.mykeypair.key_name

  tags = {
    Name = "public instance"
  }

    # The VPC Subnet
  subnet_id = element(var.public-subnets, 0)

    # Security Group
  vpc_security_group_ids = [aws_security_group.allow-ssh-single.id]
  availability_zone = "eu-west-1a"
}



