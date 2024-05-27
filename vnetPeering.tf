## HUb VNet peering with Management VNet

resource "azurerm_virtual_network_peering" "hub_peering_Mgmt" {
  provider                  = azurerm.connectivity-sub
  name                      = var.hub_Peering_Mgmt_Name
  resource_group_name       = var.Hub_Network_RG_Name
  virtual_network_name      = var.Hub_VNet_Name
  remote_virtual_network_id = azurerm_virtual_network.MGMT_VNet.id
  allow_gateway_transit     = true
  depends_on                = [azurerm_virtual_network.Hub_VNet, azurerm_virtual_network.MGMT_VNet, azurerm_virtual_network_gateway.Hub_AzureVPN]
}

## Management VNet peering with Hub VNet

resource "azurerm_virtual_network_peering" "Mgmt_peering_Hub" {
  provider                  = azurerm.management-sub
  name                      = var.Mgmt_Peering_Hub_Name
  resource_group_name       = var.MGMT_Network_RG_Name
  virtual_network_name      = var.MGMT_VNet_Name
  remote_virtual_network_id = azurerm_virtual_network.Hub_VNet.id
  use_remote_gateways       = true
  allow_gateway_transit     = false
  depends_on                = [azurerm_virtual_network.Hub_VNet, azurerm_virtual_network.MGMT_VNet, azurerm_virtual_network_gateway.Hub_AzureVPN]
}
