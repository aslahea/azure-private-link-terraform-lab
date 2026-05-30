locals {
  flattened_subnets = merge([
    for vnet_key, vnet in var.vnets : {
      for subnet_key, subnet in vnet.subnets :
      "${vnet_key}_${subnet_key}" => {
        vnet_key     = vnet_key
        subnet_key   = subnet_key
        cidr         = subnet.cidr
        is_pe_subnet = subnet_key == "pe"
      }
    }
  ]...)

  pe_subnet_keys = [
    for key, subnet in local.flattened_subnets :
    key if subnet.is_pe_subnet
  ]
}

resource "azurerm_subnet" "this" {
  for_each = local.flattened_subnets

  name                 = "subnet-${replace(each.value.subnet_key, "_", "-")}"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.this[each.value.vnet_key].name
  address_prefixes     = [each.value.cidr]

  private_endpoint_network_policies             = each.value.is_pe_subnet ? "Disabled" : null
  private_link_service_network_policies_enabled = each.value.is_pe_subnet ? true : null
}