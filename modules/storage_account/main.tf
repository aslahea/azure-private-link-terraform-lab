resource "azurerm_storage_account" "this" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  tags                     = var.tags
  account_tier             = var.account_tier
  account_replication_type = var.replication_type
  account_kind             = var.storage_account_kind
  allow_nested_items_to_be_public = var.allow_nested_items_to_be_public
  https_traffic_only_enabled = var.is_https_only_enabled
  public_network_access_enabled = var.public_network_access_enabled
}