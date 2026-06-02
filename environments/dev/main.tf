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
  public_network_access_enabled   = var.public_network_access_enabled
}

module "private_endpoint_storage" {
  source = "../../modules/private_endpoint"

  name                           = var.private_endpoint_name
  resource_group_name            = module.resource_group.name
  location                       = module.resource_group.location
  subnet_id                      = module.network.private_endpoint_subnet_id
  private_connection_resource_id = module.storage_account.storage_account_id
  subresource_names              = ["blob"]
  tags                           = var.tags
}

module "linux_vm" {
  source = "../../modules/linux_vm"

  vm_name             = var.vm_name
  username            = var.username
  size                = var.size
  public_ip_enabled   = var.public_ip_enabled
  resource_group_name = module.resource_group.name
  location            = module.resource_group.location
  subnet_id           = module.network.all_subnet_ids["vnet1_vm"]
  tags                = var.tags
}

module "private_dns" {
  source = "../../modules/private_dns"

  dns_zone_name       = var.private_dns_zone_name
  resource_group_name = module.resource_group.name
  tags                = var.tags

  vnet_links = {
    for k, v in var.vnets : k => {
      vnet_id = k == "vnet1" ? module.network.vnet1_id : module.network.vnet2_id
    }
  }
}

resource "azurerm_private_dns_a_record" "storage_dns_a_record" {
  name                = module.storage_account.storage_account_name
  zone_name           = module.private_dns.dns_zone_name
  resource_group_name = module.resource_group.name
  ttl                 = 300
  records             = [module.private_endpoint_storage.private_ip_address]
}