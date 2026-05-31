variable "resource_group_name" {
  type = string
  description = "Name of the resource group"
}

variable "location" {
  type        = string
  description = "Location of the storage account"
}

variable "tags" {
  type        = map(string)
  description = "Tags to be applied to the storage account"
}

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
  type = string
  description = "Specifies the storage account type. Required. Accepted values are StorageV2 (general purpose), BlobStorage (blob only), FileStorage (file only), or Custom (rarely used)."
}

variable "allow_nested_items_to_be_public" {
  type        = bool
  description = "Controls whether blob data can be publicly accessible."
}

variable "is_https_only_enabled" {
    type        = bool
    description = "Forces HTTPS-only traffic to the storage account."
}