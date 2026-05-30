locals {
  vnet_keys = keys(var.vnets)
  vnet1_key = local.vnet_keys[0]
  vnet2_key = length(local.vnet_keys) > 1 ? local.vnet_keys[1] : null
}