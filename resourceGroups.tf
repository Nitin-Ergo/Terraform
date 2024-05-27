## ------------------- Connectivity Sub Resource Groups----------------------------

resource "azurerm_resource_group" "Hub_Network_RG" {
  provider = azurerm.connectivity-sub
  name     = var.Hub_Network_RG_Name
  location = var.location
}

resource "azurerm_resource_group" "Hub_Security_RG" {
  provider = azurerm.connectivity-sub
  name     = var.Hub_Security_RG_Name
  location = var.location
}


## ------------------- Management Sub Resource Groups----------------------------

resource "azurerm_resource_group" "MGMT_Network_RG" {
  provider = azurerm.management-sub
  name     = var.MGMT_Network_RG_Name
  location = var.location
}

resource "azurerm_resource_group" "MGMT_Logs_RG" {
  provider = azurerm.management-sub
  name     = var.MGMT_Logs_RG_Name
  location = var.location
}

resource "azurerm_resource_group" "MGMT_Jumpbox_RG" {
  provider = azurerm.management-sub
  name     = var.MGMT_Jumpbox_RG_Name
  location = var.location
}

resource "azurerm_resource_group" "MGMT_Backup_RG" {
  provider = azurerm.management-sub
  name     = var.MGMT_Backup_RG_Name
  location = var.location
}

resource "azurerm_resource_group" "Mgmt_Security_RG" {
  provider = azurerm.management-sub
  name     = var.MGMT_Security_RG_Name
  location = var.location
}

resource "azurerm_resource_group" "MGMT_ACR_RG" {
  provider = azurerm.management-sub
  name     = var.MGMT_ACR_RG_Name
  location = var.location
}

## ------------------- Curator Staging Sub Resource Groups----------------------------

resource "azurerm_resource_group" "Cura_Staging_Network_RG" {
  provider = azurerm.cura-staging-sub
  name     = var.Cura_Staging_Network_RG_Name
  location = var.location
}

## ------------------- Curator Prod Sub Resource Groups----------------------------

resource "azurerm_resource_group" "Cura_Prod_Network_RG" {
  provider = azurerm.cura-prod-sub
  name     = var.Cura_Prod_Network_RG_Name
  location = var.location
}