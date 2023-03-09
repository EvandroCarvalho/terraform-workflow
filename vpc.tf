resource "aws_vpc" "ecs_vpc" {
  cidr_block           = "10.0.0.0/21" # 2048 ips
  enable_dns_hostnames = true

  tags = {
    Name = "ecs_vpc"
  }
}
