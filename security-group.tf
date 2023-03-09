resource "aws_security_group" "ecs_sg_public" {
  name        = "ecs_alb_sg"
  description = "Allow access from internet"
  vpc_id      = aws_vpc.ecs_vpc.id

  # in
  ingress {
    description = "allow ingress from internet"
    from_port   = 80 # http
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    # ipv6_cidr_blocks = [aws_vpc.ecs_vpc.ipv6_cidr_block]
  }

  # in
  ingress {
    description = "allow ingress from internet"
    from_port   = 443 # https
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    # ipv6_cidr_blocks = [aws_vpc.ecs_vpc.ipv6_cidr_block]
  }

  # in - monotory healthcheck
  ingress {
    description = "allow ingress from internet"
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
    # ipv6_cidr_blocks = [aws_vpc.ecs_vpc.ipv6_cidr_block]
  }

  # out
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    # ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_internet"
  }
}


resource "aws_security_group" "ecs_private" {
  name        = "ecs_sg_private"
  description = "Allow access from internet"
  vpc_id      = aws_vpc.ecs_vpc.id

  # in
  ingress {
    description     = "allow ingress from internet"
    from_port       = 80 # http
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.ecs_sg_public.id]
    # ipv6_cidr_blocks = [aws_vpc.ecs_vpc.ipv6_cidr_block]
  }

  # in
  ingress {
    description = "allow ingress from internet"
    from_port   = 443 # https
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    # ipv6_cidr_blocks = [aws_vpc.ecs_vpc.ipv6_cidr_block]
  }

  # in - monotory healthcheck
  ingress {
    description = "allow ingress from internet"
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
    # ipv6_cidr_blocks = [aws_vpc.ecs_vpc.ipv6_cidr_block]
  }

  # out
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    # ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_internet"
  }
}


#SG ALB
resource "aws_security_group" "sg_alb" {
  vpc_id = aws_vpc.ecs_vpc.id

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    description = "SG for ALB"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    "Name" = "Load Balancer"
  }

}