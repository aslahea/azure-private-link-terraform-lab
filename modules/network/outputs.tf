# ============================================================
# VNET OUTPUTS
# ============================================================
output "vnet1_id" {
  description = "ID of VNet 1"
  value       = azurerm_virtual_network.this[local.vnet1_key].id
}

output "vnet1_name" {
  description = "Name of VNet 1"
  value       = azurerm_virtual_network.this[local.vnet1_key].name
}

output "vnet2_id" {
  description = "ID of VNet 2"
  value       = local.vnet2_key != null ? azurerm_virtual_network.this[local.vnet2_key].id : null
}

output "vnet2_name" {
  description = "Name of VNet 2"
  value       = local.vnet2_key != null ? azurerm_virtual_network.this[local.vnet2_key].name : null
}

# ============================================================
# SUBNET OUTPUTS (VNet 1)
# ============================================================
output "vm_subnet_id" {
  description = "ID of VM subnet in VNet 1"
  value       = azurerm_subnet.this["${local.vnet1_key}_vm"].id
}

output "private_endpoint_subnet_id" {
  description = "ID of Private Endpoint subnet in VNet 1"
  value       = length(local.pe_subnet_keys) > 0 ? azurerm_subnet.this[local.pe_subnet_keys[0]].id : null
}

output "integration_subnet_id" {
  description = "ID of Web App Integration subnet in VNet 1 (if exists)"
  value       = can(azurerm_subnet.this["${local.vnet1_key}_integration"].id) ? azurerm_subnet.this["${local.vnet1_key}_integration"].id : null
}

# ============================================================
# SUBNET OUTPUTS (VNet 2)
# ============================================================
output "vnet2_subnet_id" {
  description = "ID of VM subnet in VNet 2 (for Task 10 cross-VNet testing)"
  value       = local.vnet2_key != null ? azurerm_subnet.this["${local.vnet2_key}_vm"].id : null
}

# ============================================================
# PEERING OUTPUTS
# ============================================================
output "vnet1_peering_name" {
  description = "Name of peering from VNet 1 to VNet 2"
  value       = length(azurerm_virtual_network_peering.peering_1_to_2) > 0 ? azurerm_virtual_network_peering.peering_1_to_2[0].name : null
}

output "vnet2_peering_name" {
  description = "Name of peering from VNet 2 to VNet 1"
  value       = length(azurerm_virtual_network_peering.peering_2_to_1) > 0 ? azurerm_virtual_network_peering.peering_2_to_1[0].name : null
}

# ============================================================
# DEBUG: All Subnet IDs (Map)
# ============================================================
output "all_subnet_ids" {
  description = "Map of all subnet IDs (for debugging)"
  value       = { for key, subnet in local.flattened_subnets : key => azurerm_subnet.this[key].id }
}
