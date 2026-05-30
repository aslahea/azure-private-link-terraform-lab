resource "azurerm_virtual_network_peering" "peering_1_to_2" {
  count                        = local.vnet2_key != null ? 1 : 0
  name                         = "peering-from-${local.vnet1_key}-to-${local.vnet2_key}"
  resource_group_name          = var.resource_group_name
  virtual_network_name         = azurerm_virtual_network.this[local.vnet1_key].name
  remote_virtual_network_id    = azurerm_virtual_network.this[local.vnet2_key].id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
}

resource "azurerm_virtual_network_peering" "peering_2_to_1" {
  count                        = local.vnet2_key != null ? 1 : 0
  name                         = "peering-from-${local.vnet2_key}-to-${local.vnet1_key}"
  resource_group_name          = var.resource_group_name
  virtual_network_name         = azurerm_virtual_network.this[local.vnet2_key].name
  remote_virtual_network_id    = azurerm_virtual_network.this[local.vnet1_key].id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true

  # Ensure peerings are created sequentially to avoid concurrent modification errors in Azure
  depends_on = [azurerm_virtual_network_peering.peering_1_to_2]
}
