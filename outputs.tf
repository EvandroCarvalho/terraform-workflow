output "vpc_id" {
  value = aws_vpc.ecs_vpc.id
}

output "igw_id" {
  value = aws_internet_gateway.gw.id
}

# output "subnets_ids" {
#   value = {for k,v in aws_subnet.this : v.tags.Name => v.id}
# }

output "route_table_id_public" {
  value = aws_route_table.route_table_public.id
}

output "route_table_id_private" {
  value = aws_route_table.route_table_private.id
}