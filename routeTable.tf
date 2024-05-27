## ----------------- Connectivity Route Table-----------------------------------------

resource "azurerm_route_table" "Hub_RouteTable" {
  provider                      = azurerm.connectivity-sub
  name                          = var.Hub_RouteTable_Name
  location                      = var.location
  resource_group_name           = var.Hub_Network_RG_Name
  disable_bgp_route_propagation = false

  route {
    name                   = "DefaultRoute"
    address_prefix         = "0.0.0.0/0"
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = module.firewall.firewall.ip_configuration[0].private_ip_address
  }
}

resource "azurerm_subnet_route_table_association" "Hub_DnsResolverInboundSubnet_RouteTable" {
  provider       = azurerm.connectivity-sub
  subnet_id      = azurerm_subnet.DnsResolverInboundSubnet.id
  route_table_id = azurerm_route_table.Hub_RouteTable.id
  depends_on     = [azurerm_private_dns_resolver_inbound_endpoint.Hub_DnsResolver_Inbound]
}

resource "azurerm_subnet_route_table_association" "Hub_DnsResolverOutboundSubnet_RouteTable" {
  provider       = azurerm.connectivity-sub
  subnet_id      = azurerm_subnet.DnsResolverOutboundSubnet.id
  route_table_id = azurerm_route_table.Hub_RouteTable.id
  depends_on     = [azurerm_private_dns_resolver_outbound_endpoint.Hub_DnsResolver_Outbound]
}


## ----------------- Management Route Table -----------------------------------------

resource "azurerm_route_table" "MGMT_RouteTable" {
  provider                      = azurerm.management-sub
  name                          = var.MGMT_RouteTable_Name
  location                      = var.location
  resource_group_name           = var.MGMT_Network_RG_Name
  disable_bgp_route_propagation = false

  route {
    name                   = "DefaultRoute"
    address_prefix         = "0.0.0.0/0"
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = module.firewall.firewall.ip_configuration[0].private_ip_address
  }
}

resource "azurerm_subnet_route_table_association" "MGMT_ManagementSubnet_RouteTable" {
  provider       = azurerm.management-sub
  subnet_id      = azurerm_subnet.ManagementSubnet.id
  route_table_id = azurerm_route_table.MGMT_RouteTable.id
  depends_on     = [azurerm_subnet.ManagementSubnet]
}

resource "azurerm_subnet_route_table_association" "Postgres_Subnet_RouteTable" {
  provider       = azurerm.management-sub
  subnet_id      = azurerm_subnet.PostgresSubnet.id
  route_table_id = azurerm_route_table.MGMT_RouteTable.id
  depends_on     = [azurerm_subnet.PostgresSubnet]
}
