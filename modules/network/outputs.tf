output "vnet_ids" {
  value       = { for k, v in azurerm_virtual_network.this : k => v.id }
  description = "Map of virtual network IDs"
}

output "vnet_names" {
  value       = { for k, v in azurerm_virtual_network.this : k => v.name }
  description = "Map of virtual network names"
}

output "subnet_ids" {
  value       = { for k, v in azurerm_subnet.this : k => v.id }
  description = "Map of all subnet IDs"
}
