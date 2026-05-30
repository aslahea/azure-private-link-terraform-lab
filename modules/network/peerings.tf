locals {
  # Identify spokes (all VNets except VNet 1 which acts as the Hub)
  spoke_keys = slice(local.vnet_keys, 1, length(local.vnet_keys))

  # Generate bidirectional peerings dynamically between Hub and Spokes
  peering_pairs = merge([
    for spoke in local.spoke_keys : {
      "${local.vnet1_key}_to_${spoke}" = { src_key = local.vnet1_key, dst_key = spoke }
      "${spoke}_to_${local.vnet1_key}" = { src_key = spoke, dst_key = local.vnet1_key }
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
