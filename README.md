# Azure Private Link Terraform Lab (Week 41 Mini Project 1)

This repository contains the Terraform configuration to provision a secure, private network architecture in Microsoft Azure using Private Link and Private DNS Zones. 

## Architectural Design & Workouts

1. **Virtual Network Provisioning**:
   - Create a Hub/Spoke virtual network topology (`vnet1` and `vnet2`).
   - Define subnets for virtual machines and dedicated private endpoint subnets.
2. **Private Endpoint Integration**:
   - Provision an Azure App Service (Web App) or Azure Storage.
   - Configure a Private Endpoint for the resource and attach it to the dedicated private endpoint subnet.
3. **Private DNS Configuration**:
   - Deploy a Private DNS Zone (`privatelink.azurewebsites.net`).
   - Link the Private DNS Zone to both virtual networks to enable resolution.
4. **Secure Compute Client**:
   - Deploy a client Virtual Machine inside the VNet to serve as a private access client.
5. **Cross-VNet Connectivity**:
   - Establish bidirectional Virtual Network Peering between `vnet1` and `vnet2` to confirm cross-VNet private access.
6. **Access Control**:
   - Disable public network access to the App Service / Storage, enforcing traffic through the Private Link.
