variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
}

variable "location" {
  type        = string
  description = "Azure region"
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to all network resources"
}

variable "vnets" {
  type = map(object({
    name = string
    cidr = list(string)
    subnets = map(object({
      cidr                           = string
      private_endpoint_network_policies = optional(string)
      private_link_service_network_policies = optional(string)
      delegation                     = optional(string)
    }))
  }))
  description = "Map of VNets and their subnets"
}