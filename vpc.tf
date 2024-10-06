resource "aws_vpc" "main" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "vpc-42"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "main-igw"
  }
}

resource "aws_eip" "full_eip-a" {
  depends_on = [aws_internet_gateway.gw]
}


resource "aws_nat_gateway" "ngw-azA" {
  allocation_id = aws_eip.full_eip-a.id
  subnet_id     = aws_subnet.subnet-a-pub.id

  tags = {
    Name = "gw NAT subnet A"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.gw]
}
