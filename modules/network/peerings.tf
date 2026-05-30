locals {
  # Get all VNet keys
  vnet_keys_list = keys(var.vnets)

  # Generate all unique pair combinations for bidirectional peering
  # For N VNets, this automatically generates N * (N - 1) peering directions.
  peering_pairs = merge([
    for src_key in local.vnet_keys_list : {
      for dst_key in local.vnet_keys_list :
      "${src_key}_to_${dst_key}" => {
        src_key = src_key
        dst_key = dst_key
      } if src_key != dst_key
    }
  ]...)
}

resource "azurerm_virtual_network_peering" "this" {
  for_each = local.peering_pairs

  name                         = "peering-from-${each.value.src_key}-to-${each.value.dst_key}"
  resource_group_name          = var.resource_group_name
  virtual_network_name         = azurerm_virtual_network.this[each.value.src_key].name
  remote_virtual_network_id    = azurerm_virtual_network.this[each.value.dst_key].id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
}
