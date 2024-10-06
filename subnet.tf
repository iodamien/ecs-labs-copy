resource "aws_subnet" "subnet-a-prv" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "eu-west-3a"

  tags = {
    Name = "subnet-a-prv"
  }
}

resource "aws_subnet" "subnet-b-prv" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "eu-west-3b"

  tags = {
    Name = "subnet-b-prv"
  }
}

resource "aws_subnet" "subnet-a-pub" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.10.0/24"
  availability_zone = "eu-west-3a"

  tags = {
    Name = "subnet-a-pub"
  }
}

resource "aws_subnet" "subnet-b-pub" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.20.0/24"
  availability_zone = "eu-west-3b"

  tags = {
    Name = "subnet-b-pub"
  }
}