resource "azurerm_network_watcher" "Hub_Network_Watcher" {
  provider            = azurerm.connectivity-sub
  name                = var.Hub_Network_Watcher_Name
  location            = var.location
  resource_group_name = var.Hub_Network_RG_Name
  depends_on          = [azurerm_resource_group.Hub_Network_RG]
}

resource "azurerm_network_watcher" "MGMT_Network_Watcher" {
  provider            = azurerm.management-sub
  name                = var.MGMT_Network_Watcher_Name
  location            = var.location
  resource_group_name = var.MGMT_Network_RG_Name
  depends_on          = [azurerm_resource_group.MGMT_Network_RG]
}

resource "azurerm_network_watcher" "Cura_Staging_Network_Watcher" {
  provider            = azurerm.cura-staging-sub
  name                = var.Cura_Staging_Network_Watcher_Name
  location            = var.location
  resource_group_name = var.Cura_Staging_Network_RG_Name
  depends_on          = [azurerm_resource_group.Cura_Staging_Network_RG]
}

resource "azurerm_network_watcher" "Cura_Prod_Network_Watcher" {
  provider            = azurerm.cura-prod-sub
  name                = var.Cura_Prod_Network_Watcher_Name
  location            = var.location
  resource_group_name = var.Cura_Prod_Network_RG_Name
  depends_on          = [azurerm_resource_group.Cura_Prod_Network_RG]
}