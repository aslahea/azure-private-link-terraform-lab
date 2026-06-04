variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
}

variable "location" {
  type        = string
  description = "Azure region"
  default     = "centralindia"
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to all resources"
}

# network module variables

variable "vnets" {
  type = map(object({
    name = string
    cidr = list(string)
    subnets = map(object({
      cidr                                  = string
      private_endpoint_network_policies     = optional(string)
      private_link_service_network_policies = optional(string)
      delegation                            = optional(string)
    }))
  }))
  description = "Map of VNets and their subnets to be created"
}

# storage account module variables

variable "storage_account_name" {
  type        = string
  description = "Globally unique storage account name"
}

variable "account_tier" {
  type        = string
  description = "Storage account performance tier"
}

variable "replication_type" {
  type        = string
  description = "Storage replication type"
}

variable "storage_account_kind" {
  type        = string
  description = "Storage account kind"
}

variable "allow_nested_items_to_be_public" {
  type        = bool
  description = "Controls whether blob data can be publicly accessible."
}

variable "is_https_only_enabled" {
  type        = bool
  description = "Forces HTTPS-only traffic to the storage account."
}

# private endpoint module variables

variable "private_endpoint_name" {
  type        = string
  description = "Name of the private endpoint"
}

# Linux VM module Variables

variable "vm_name" {
  type        = string
  description = "Name of the virtual machine"
}

variable "username" {
  type        = string
  description = "Admin username for the VM"
}

variable "size" {
  type        = string
  description = "Azure Vm size"
}

variable "public_ip_enabled" {
  type        = bool
  description = "Enable public IP for the VM"
}

# private dns module variables

variable "private_dns_zone_name" {
  type        = string
  description = "Name of the Private DNS Zone"
}

variable "public_network_access_enabled" {
  type        = bool
  description = "Whether public network access is allowed for the storage account"
  default     = false
}