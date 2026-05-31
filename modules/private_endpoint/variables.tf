variable "name" {
  type        = string
  description = "Name of the private endpoint"
}

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
}

variable "location" {
  type        = string
  description = "Azure region"
}

variable "subnet_id" {
  type        = string
  description = "ID of the subnet where the private endpoint will be attached"
}

variable "private_connection_resource_id" {
  type        = string
  description = "Resource ID of the target resource (e.g. storage account, web app)"
}

variable "subresource_names" {
  type        = list(string)
  description = "Subresource names (e.g. ['blob'] for storage account, ['sites'] for web app)"
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply"
  default     = {}
}
