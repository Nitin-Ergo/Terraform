resource "azurerm_virtual_network" "Hub_VNet" {
  provider            = azurerm.connectivity-sub
  name                = var.Hub_VNet_Name
  address_space       = [var.Hub_VNet_Range]
  location            = var.location
  resource_group_name = var.Hub_Network_RG_Name
  depends_on          = [azurerm_network_watcher.Hub_Network_Watcher]
}

resource "azurerm_subnet" "AzureFirewallSubnet" {
  provider             = azurerm.connectivity-sub
  name                 = "AzureFirewallSubnet"
  resource_group_name  = var.Hub_Network_RG_Name
  virtual_network_name = var.Hub_VNet_Name
  address_prefixes     = [var.Hub_AzureFirewallSubnet_Range]
  depends_on           = [azurerm_virtual_network.Hub_VNet]
}

resource "azurerm_subnet" "GatewaySubnet" {
  provider             = azurerm.connectivity-sub
  name                 = "GatewaySubnet"
  resource_group_name  = var.Hub_Network_RG_Name
  virtual_network_name = var.Hub_VNet_Name
  address_prefixes     = [var.Hub_GatewaySubnet_Range]
  depends_on           = [azurerm_virtual_network.Hub_VNet]
}

resource "azurerm_subnet" "ApplicationGatewaySubnet" {
  provider             = azurerm.connectivity-sub
  name                 = "ApplicationGatewaySubnet"
  resource_group_name  = var.Hub_Network_RG_Name
  virtual_network_name = var.Hub_VNet_Name
  address_prefixes     = [var.Hub_ApplicationGatewaySubnet_Range]
  depends_on           = [azurerm_virtual_network.Hub_VNet]
}

resource "azurerm_subnet" "AzureBastionSubnet" {
  provider             = azurerm.connectivity-sub
  name                 = "AzureBastionSubnet"
  resource_group_name  = var.Hub_Network_RG_Name
  virtual_network_name = var.Hub_VNet_Name
  address_prefixes     = [var.Hub_AzureBastionSubnet_Range]
  depends_on           = [azurerm_virtual_network.Hub_VNet]
}

resource "azurerm_subnet" "DnsResolverInboundSubnet" {
  provider             = azurerm.connectivity-sub
  name                 = "DnsResolverInboundSubnet"
  resource_group_name  = var.Hub_Network_RG_Name
  virtual_network_name = var.Hub_VNet_Name
  address_prefixes     = [var.Hub_DnsResolverInboundSubnet_Range]
  delegation {
    name = "delegation"
    service_delegation {
      name    = "Microsoft.Network/dnsResolvers"
      actions = ["Microsoft.Network/virtualNetworks/subnets/join/action"]
    }
  }
  depends_on = [azurerm_virtual_network.Hub_VNet]
}

resource "azurerm_subnet" "DnsResolverOutboundSubnet" {
  provider             = azurerm.connectivity-sub
  name                 = "DnsResolverOutboundSubnet"
  resource_group_name  = var.Hub_Network_RG_Name
  virtual_network_name = var.Hub_VNet_Name
  address_prefixes     = [var.Hub_DnsResolverOutboundSubnet_Range]
  delegation {
    name = "delegation"
    service_delegation {
      name    = "Microsoft.Network/dnsResolvers"
      actions = ["Microsoft.Network/virtualNetworks/subnets/join/action"]
    }
  }
  depends_on = [azurerm_virtual_network.Hub_VNet]
}


## ---------------------- Management VNets ------------------------------

resource "azurerm_virtual_network" "MGMT_VNet" {
  provider            = azurerm.management-sub
  name                = var.MGMT_VNet_Name
  address_space       = [var.MGMT_VNet_Range]
  location            = var.location
  resource_group_name = var.MGMT_Network_RG_Name
  depends_on          = [azurerm_network_watcher.MGMT_Network_Watcher]
}

resource "azurerm_subnet" "ManagementSubnet" {
  provider             = azurerm.management-sub
  name                 = "ManagementSubnet"
  resource_group_name  = var.MGMT_Network_RG_Name
  virtual_network_name = var.MGMT_VNet_Name
  address_prefixes     = [var.MGMT_Subnet_Range]
  depends_on           = [azurerm_virtual_network.MGMT_VNet]
  service_endpoints = [
    "Microsoft.Storage"
  ]
}

# TODO(pbourke): this should never have been added here, check if can be removed
resource "azurerm_subnet" "PostgresSubnet" {
  provider             = azurerm.management-sub
  name                 = "PostgresSubnet"
  resource_group_name  = var.MGMT_Network_RG_Name
  virtual_network_name = var.MGMT_VNet_Name
  address_prefixes     = [var.Postgres_Subnet_Range]
  depends_on           = [azurerm_virtual_network.MGMT_VNet]

  delegation {
    name = "fs"
    service_delegation {
      name = "Microsoft.DBforPostgreSQL/flexibleServers"

      actions = [
        "Microsoft.Network/virtualNetworks/subnets/join/action",
      ]
    }
  }
}
