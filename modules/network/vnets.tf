resource "azurerm_virtual_network" "this" {
  for_each = var.vnets

  name                = each.value.name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = each.value.cidr
  tags                = var.tags
}