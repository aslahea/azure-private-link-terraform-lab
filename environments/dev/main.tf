module "resource_group" {
  source = "../../modules/resource_group"

  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}

module "network" {
  source              = "../../modules/network"
  resource_group_name = module.resource_group.name
  location            = module.resource_group.location
  tags                = var.tags
  vnets               = var.vnets
}

module "storage_account" {
  source = "../../modules/storage_account"

  resource_group_name             = module.resource_group.name
  location                        = module.resource_group.location
  tags                            = var.tags
  storage_account_name            = var.storage_account_name
  account_tier                    = var.account_tier
  replication_type                = var.replication_type
  storage_account_kind            = var.storage_account_kind
  allow_nested_items_to_be_public = var.allow_nested_items_to_be_public
  is_https_only_enabled           = var.is_https_only_enabled
}

module "private_endpoint_storage" {
  source = "../../modules/private_endpoint"

  name                           = "pe-${var.storage_account_name}"
  resource_group_name            = module.resource_group.name
  location                       = module.resource_group.location
  subnet_id                      = module.network.private_endpoint_subnet_id
  private_connection_resource_id = module.storage_account.storage_account_id
  subresource_names              = ["blob"]
  tags                           = var.tags
}