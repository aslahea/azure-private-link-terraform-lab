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
  description = "ID of the subnet for the private endpoint"
}

variable "private_connection_resource_id" {
  type        = string
  description = "ID of the resource to connect to"
}

variable "name" {
  type        = string
  description = "Name of the private endpoint"
}

variable "subresource_names" {
  type        = list(string)
  description = "List of subresource names (e.g. ['blob'])"
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply"
}