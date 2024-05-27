## ------------------- AVD Sub Resource Groups----------------------------

resource "azurerm_resource_group" "AVD_Network_RG" {
  provider = azurerm.avd-sub
  name     = var.AVD_Network_RG_Name
  location = var.location
}