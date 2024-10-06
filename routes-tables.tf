resource "aws_default_route_table" "main" {
  default_route_table_id = aws_vpc.main.default_route_table_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
    #nat_gateway_id = aws_nat_gateway.ngw-azA.id
  }

  tags = {
    Name = "default-route-table"
  }
}

resource "aws_route_table" "rtb-public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block     = "0.0.0.0/0"
    #nat_gateway_id = aws_nat_gateway.ngw-azA.id
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "public-route"
  }
}


resource "aws_route_table_association" "sub-pub-a" {
  subnet_id      = aws_subnet.subnet-a-pub.id
  route_table_id = aws_route_table.rtb-public.id
}

resource "aws_route_table_association" "sub-pub-b" {
  subnet_id      = aws_subnet.subnet-b-pub.id
  route_table_id = aws_route_table.rtb-public.id
}




# AZ A

resource "aws_route_table" "sub-prv" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.ngw-azA.id
  }

  tags = {
    Name = "private-route"
  }
}

resource "aws_route_table_association" "sub-prv-a" {
  subnet_id      = aws_subnet.subnet-a-prv.id
  route_table_id = aws_route_table.sub-prv.id
}


resource "aws_route_table_association" "sub-prv-b" {
  subnet_id      = aws_subnet.subnet-b-prv.id
  route_table_id = aws_route_table.sub-prv.id
}