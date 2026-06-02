variable "subnet_id" {
    type = string
    description = "ID of the subnet for the VM"
}

variable "vm_name" {
    type = string
    description = "Name of the VM"
}

variable "username" {
    type = string
    description = "username of the VM"
}

variable "resource_group_name" {
    type = string
    description = "Name of the resource group"
}

variable "location" {
    type = string
    description = "Location of the VM"
}

variable "tags" {
    type = map(string)
    description = "Tags to apply to the VM"
}

variable "size" {
    type = string
    description = "Size of the VM"
}

variable "public_ip_enabled" {
    type = bool
    description = "Enable public IP for the VM"
}

variable "custom_data" {
  type        = string
  description = "Custom user data script for the VM"
  default     = null
}