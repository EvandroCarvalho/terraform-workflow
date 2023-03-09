resource "aws_route_table" "route_table_public" {
  vpc_id = aws_vpc.ecs_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "ecs_public_rt"
  }
}

resource "aws_route_table" "route_table_private" {
  vpc_id = aws_vpc.ecs_vpc.id

  tags = {
    Name = "ecs_private_rt"
  }
}

resource "aws_route_table_association" "rt_associate_public_a" {
  subnet_id      = aws_subnet.public_subnet_a.id
  route_table_id = aws_route_table.route_table_public.id
}

resource "aws_route_table_association" "rt_associate_public_b" {
  subnet_id      = aws_subnet.public_subnet_b.id
  route_table_id = aws_route_table.route_table_public.id
}

resource "aws_route_table_association" "rt_associate_private_a" {
  subnet_id      = aws_subnet.private_subnet_a.id
  route_table_id = aws_route_table.route_table_private.id
}

resource "aws_route_table_association" "rt_associate_private_b" {
  subnet_id      = aws_subnet.private_subnet_b.id
  route_table_id = aws_route_table.route_table_private.id
}