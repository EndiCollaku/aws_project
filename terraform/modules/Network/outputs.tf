output "vpc_id" {
  value = aws_vpc.vpc.id
}


output "PUBLIC_SUBNET_IDS" {
  value = [for v in aws_subnet.subnets : v.id if v.map_public_ip_on_launch]
}

output "PRIVATE_SUBNET_IDS" {
  value = [for v in aws_subnet.subnets : v.id if !v.map_public_ip_on_launch]
}

