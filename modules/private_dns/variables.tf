variable "dns_zone_name" {
  type        = string
  description = "The name of the Private DNS Zone"
}

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
}

variable "vnet_links" {
  type = map(object({
    vnet_id              = string
    registration_enabled = optional(bool, false)
  }))
  description = "Map of Virtual Network IDs to link to the Private DNS Zone"
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to resources"
}
