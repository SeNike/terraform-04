output "subnet_id" {
  description = "ID of the created subnet"
  value       = yandex_vpc_subnet.subnet.id
}

output "subnet_cidr" {
  description = "CIDR block of the created subnet"
  value       = yandex_vpc_subnet.subnet.v4_cidr_blocks[0]
}