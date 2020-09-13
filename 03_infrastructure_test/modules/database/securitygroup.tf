resource "aws_security_group" "mongodb_security_group"{
  name = "MongoDB security group"
  vpc_id = var.vpc-id
  description = "MongoDB security group"

  ingress {
    from_port = 1024
    protocol = "tcp"
    to_port = 65535
    cidr_blocks = ["10.0.0.0/16"]
  }
  egress {
    from_port = 27017
    protocol = "tcp"
    to_port = 27017
    cidr_blocks = ["10.0.1.0/24"]
  }
  egress {
    from_port = 27017
    protocol = "tcp"
    to_port = 27017
    cidr_blocks = ["10.0.2.0/24"]
  }
  egress {
    from_port = 27017
    protocol = "tcp"
    to_port = 27017
    cidr_blocks = ["10.0.3.0/24"]
  }
  egress {
    from_port = 27017
    protocol = "tcp"
    to_port = 27017
    cidr_blocks = ["10.0.101.0/24"]
  }

  egress {
    from_port = 27017
    protocol = "tcp"
    to_port = 27017
    cidr_blocks = ["10.0.102.0/24"]
  }
  egress {
    from_port = 27017
    protocol = "tcp"
    to_port = 27017
    cidr_blocks = ["10.0.103.0/24"]
  }

  egress {
    from_port = 27017
    protocol = "tcp"
    to_port = 27017
    cidr_blocks = ["10.0.104.0/24"]
  }
  egress {
    from_port = 27017
    protocol = "tcp"
    to_port = 27017
    cidr_blocks = ["10.0.105.0/24"]
  }
  }