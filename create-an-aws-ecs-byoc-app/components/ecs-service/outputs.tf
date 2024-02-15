output "private_subnet_ids" {
  value = var.private_subnet_ids
}

output "public_subnet_ids" {
  value = local.public_subnet_id_list
}
