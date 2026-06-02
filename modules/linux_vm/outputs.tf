output "private_key" {
  description = "The generated private SSH key for the VM"
  value       = tls_private_key.vm_key.private_key_pem
  sensitive   = true
}

output "public_ip_address" {
  description = "The public IP address of the VM"
  value       = var.public_ip_enabled ? azurerm_public_ip.vm_pip[0].ip_address : null
}
