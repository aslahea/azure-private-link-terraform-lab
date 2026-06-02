# Resource Group Outputs
output "resource_group_name" {
  description = "Name of the resource group"
  value       = module.resource_group.name
}

output "resource_group_id" {
  description = "ID of the resource group"
  value       = module.resource_group.id
}

# Network Outputs
output "vnet1_id" {
  description = "ID of VNet 1"
  value       = module.network.vnet1_id
}

output "vnet1_name" {
  description = "Name of VNet 1"
  value       = module.network.vnet1_name
}

output "vnet2_id" {
  description = "ID of VNet 2"
  value       = module.network.vnet2_id
}

output "vnet2_name" {
  description = "Name of VNet 2"
  value       = module.network.vnet2_name
}

output "vm_subnet_id" {
  description = "ID of VM subnet in VNet 1"
  value       = module.network.vm_subnet_id
}

output "private_endpoint_subnet_id" {
  description = "ID of Private Endpoint subnet in VNet 1"
  value       = module.network.private_endpoint_subnet_id
}

output "vnet2_subnet_id" {
  description = "ID of VM subnet in VNet 2 (for cross-VNet testing)"
  value       = module.network.vnet2_subnet_id
}

# Storage Account Outputs
output "storage_account_id" {
  description = "ID of the Storage Account"
  value       = module.storage_account.storage_account_id
}

output "storage_account_name" {
  description = "Name of the Storage Account"
  value       = module.storage_account.storage_account_name
}

output "storage_account_primary_blob_endpoint" {
  description = "Primary blob endpoint of the Storage Account"
  value       = module.storage_account.storage_account_primary_blob_endpoint
}

# Private Endpoint Outputs
output "private_endpoint_id" {
  description = "The ID of the private endpoint"
  value       = module.private_endpoint_storage.id
}

output "private_endpoint_name" {
  description = "The name of the private endpoint"
  value       = module.private_endpoint_storage.name
}

output "private_endpoint_private_ip" {
  description = "The private IP address of the private endpoint"
  value       = module.private_endpoint_storage.private_ip_address
}

# Linux VM Outputs
output "vm_private_key" {
  description = "The generated private SSH key for the client VM"
  value       = module.linux_vm.private_key
  sensitive   = true
}

output "vm_public_ip" {
  description = "The public IP address of the client VM"
  value       = module.linux_vm.public_ip_address
}

# Private DNS Outputs
output "private_dns_zone_id" {
  description = "The ID of the Private DNS Zone"
  value       = module.private_dns.dns_zone_id
}

output "private_dns_zone_name" {
  description = "The name of the Private DNS Zone"
  value       = module.private_dns.dns_zone_name
}

# Verification & Connection Helper Outputs
output "vm_ssh_command" {
  description = "SSH command to connect to the client VM"
  value       = "ssh -i vm_key.pem ${var.username}@${module.linux_vm.public_ip_address}"
}

output "storage_private_fqdn" {
  description = "The private FQDN of the storage account blob endpoint"
  value       = "${module.storage_account.storage_account_name}.blob.core.windows.net"
}

output "dns_validation_command" {
  description = "DNS validation command to run inside the VM"
  value       = "nslookup ${module.storage_account.storage_account_name}.blob.core.windows.net"
}

output "http_validation_command" {
  description = "HTTP connection test command to run inside the VM"
  value       = "curl -I https://${module.storage_account.storage_account_name}.blob.core.windows.net/"
}
