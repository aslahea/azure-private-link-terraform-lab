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

variable "vnets" {
  type = map(object({
    name = string
    cidr = list(string)
    subnets = map(object({
      cidr = string
    }))
  }))
}