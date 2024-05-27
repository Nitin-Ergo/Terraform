##------------ Get tenant id, vpn shared key & jumpbox password from the key vault------------------------------------------

data "azurerm_key_vault" "keyvault_terraform" {
  name                = "cgt-eun-mgmt-tf-kv"
  resource_group_name = "cgt-eun-mgmt-terraform-rg"
  provider            = azurerm.management-sub
}

data "azurerm_key_vault_secret" "TenantID" {
  name         = "TenantID"
  key_vault_id = data.azurerm_key_vault.keyvault_terraform.id
  provider     = azurerm.management-sub
}

data "azurerm_key_vault_secret" "JumpboxPassword" {
  name         = "JumpboxPassword"
  key_vault_id = data.azurerm_key_vault.keyvault_terraform.id
  provider     = azurerm.management-sub
}

data "azurerm_key_vault_secret" "VPNSharedKey" {
  name         = "VPNSharedKey"
  key_vault_id = data.azurerm_key_vault.keyvault_terraform.id
  provider     = azurerm.management-sub
}

##-----------Location---------------

variable "location" {
  type        = string
  default     = "northeurope"
  description = "Environment Location"
}

variable "location_shortcode" {
  type        = string
  default     = "eun"
  description = "Environment Location ShortCode"
}

variable "environment" {
  type        = string
  default     = "dev"
  description = "Environment Name"
}

##-----------Subscriptions---------------

variable "Connectivity_Sub_Id" {
  type        = string
  default     = "df1f36c2-b9dc-41e5-b607-72b65f53ec46"
  description = "Connectivity Subscription ID"
}

variable "MGMT_Sub_Id" {
  type        = string
  default     = "0126eaae-6d5f-4884-8c38-110c48afa86a"
  description = "Management Subscription ID"
}

variable "Cura_Staging_Sub_Id" {
  type        = string
  default     = "d66c28ed-01ba-4019-8e43-80053313dacb"
  description = "Curator Staging Subscription ID"
}

variable "Cura_Prod_Sub_Id" {
  type        = string
  default     = "ac5223c0-d841-457e-8bd8-208ed330899e"
  description = "Curator Prod Subscription ID"
}

##-----------Connectivity Sub Resource Groups---------------

variable "Hub_Network_RG_Name" {
  type        = string
  default     = "cgt-eun-hub-network-rg"
  description = "Network Resource Group"
}

variable "Hub_Security_RG_Name" {
  type        = string
  default     = "cgt-eun-hub-security-rg"
  description = "Security Resource Group"
}

##-----------Management AZDO Self Hosted Agents---------------

variable "MGMT_Sub_AZDO_VMSS_Name" {
  type    = string
  default = "cgt-eun-mgmt-agents-vmss"
}

##-----------Public DNS---------------
variable "Public_DNS_Zone_Name" {
  type        = string
  default     = "p.carnegroup.com"
  description = "Parent public DNS zone for this Platform LZ. App LZs will create child zones off this. Note, on initial deploy, a ticket needs to be filed with Ergo to delegate the nameservers for this zone in the external Carne DNS registrar."
}

##-----------Management Sub Resource Groups---------------

variable "MGMT_Network_RG_Name" {
  type        = string
  default     = "cgt-eun-mgmt-network-rg"
  description = "Network Resource Group"
}

variable "MGMT_Logs_RG_Name" {
  type        = string
  default     = "cgt-eun-mgmt-logs-rg"
  description = "Logs Resource Group"
}

variable "MGMT_Jumpbox_RG_Name" {
  type        = string
  default     = "cgt-eun-mgmt-jumpbox-rg"
  description = "Jumpbox Resource Group"
}

variable "MGMT_Backup_RG_Name" {
  type        = string
  default     = "cgt-eun-mgmt-backup-rg"
  description = "Backup Resource Group"
}

variable "MGMT_AZDO_Agents_RG_Name" {
  type        = string
  default     = "cgt-eun-mgmt-agents-rg"
  description = "AZDO Self Hosted Resource Group"
}

variable "MGMT_Security_RG_Name" {
  type        = string
  default     = "cgt-eun-mgmt-security-rg"
  description = "Security Resource Group"
}

variable "MGMT_ACR_RG_Name" {
  type        = string
  default     = "cgt-eun-mgmt-acr-rg"
  description = "ACR Resource Group"
}

##-----------Curator Sub Resource Groups---------------

variable "Cura_Staging_Network_RG_Name" {
  type        = string
  default     = "cura-eun-staging-network-rg"
  description = "Network Resource Group"
}

variable "Cura_Prod_Network_RG_Name" {
  type        = string
  default     = "cura-eun-prod-network-rg"
  description = "Network Resource Group"
}


##-----------Network Watcher---------------

variable "Hub_Network_Watcher_Name" {
  type        = string
  default     = "cgt-eun-hub-networkwatcher01"
  description = "Hub Network Watcher Name"
}

variable "MGMT_Network_Watcher_Name" {
  type        = string
  default     = "cgt-eun-mgmt-networkwatcher01"
  description = "MGMT Network Watcher Name"
}

variable "Cura_Staging_Network_Watcher_Name" {
  type        = string
  default     = "cura-eun-staging-networkwatcher01"
  description = "Cura Staging Network Watcher Name"
}

variable "Cura_Prod_Network_Watcher_Name" {
  type        = string
  default     = "cura-eun-prod-networkwatcher01"
  description = "Cura Prod Network Watcher Name"
}

##-----------Hub Networking---------------

variable "Hub_VNet_Name" {
  type        = string
  default     = "cgt-eun-hub-vnet01"
  description = "Hub VNet Name"
}

variable "Hub_VNet_Range" {
  type        = string
  default     = "10.201.0.0/22"
  description = "Hub VNet Range"
}

variable "Hub_AzureFirewallSubnet_Range" {
  type        = string
  default     = "10.201.0.0/26"
  description = "Hub Firewall Subnet Range"
}

variable "Hub_GatewaySubnet_Range" {
  type        = string
  default     = "10.201.0.64/26"
  description = "Hub Gateway Subnet Range"
}

variable "Hub_ApplicationGatewaySubnet_Range" {
  type        = string
  default     = "10.201.0.128/26"
  description = "Hub App GW Subnet Range"
}

variable "Hub_AzureBastionSubnet_Range" {
  type        = string
  default     = "10.201.0.192/26"
  description = "Hub Bastian Subnet Range"
}

variable "Hub_DnsResolverInboundSubnet_Range" {
  type        = string
  default     = "10.201.1.0/26"
  description = "Hub DNS Resolver Inbound Subnet Range"
}

variable "Hub_DnsResolverOutboundSubnet_Range" {
  type        = string
  default     = "10.201.1.64/26"
  description = "Hub DNS Resolver Outnbound Subnet Range"
}

variable "hub_Peering_Mgmt_Name" {
  type        = string
  default     = "HubVnet-Peering-MgmtVnet"
  description = "Hub VNet Peering Name"
}

variable "hub_Peering_Cura_Staging_Name" {
  type        = string
  default     = "HubVnet-Peering-CuraStagingVnet"
  description = "Hub VNet Peering Name"
}

variable "hub_Peering_Cura_Prod_Name" {
  type        = string
  default     = "HubVnet-Peering-CuraProdVnet"
  description = "Hub VNet Peering Name"
}

variable "Hub_NSG_Name" {
  type        = string
  default     = "cgt-eun-hub-nsg01"
  description = "Hub NSG Name"
}

variable "Hub_RouteTable_Name" {
  type        = string
  default     = "cgt-eun-hub-rt01"
  description = "Hub RT Name"
}

##-----------Management Networking---------------

variable "MGMT_VNet_Name" {
  type        = string
  default     = "cgt-eun-mgmt-vnet01"
  description = "Mgmt VNet Name"
}

variable "MGMT_VNet_Range" {
  type        = string
  default     = "10.201.8.0/22"
  description = "MGMT VNet Range"
}

variable "MGMT_Subnet_Range" {
  type        = string
  default     = "10.201.8.0/26"
  description = "Management Subnet Range"
}

variable "Postgres_Subnet_Range" {
  type        = string
  default     = "10.201.8.64/26"
  description = "Postgres DB Subnet Range"
}

variable "Mgmt_Peering_Hub_Name" {
  type        = string
  default     = "MgmtVnet-Peering-HubVnet"
  description = "Mgmt VNet Peering Name"
}

variable "MGMT_NSG_Name" {
  type        = string
  default     = "cgt-eun-mgmt-nsg01"
  description = "MGMT NSG Name"
}

variable "MGMT_RouteTable_Name" {
  type        = string
  default     = "cgt-eun-mgmt-rt01"
  description = "MGMT RT Name"
}

## ---------- Subnet Range for Firewall whitelisting

variable "DevOps_LZ_VNet_Range" {
  type        = string
  default     = "10.201.12.0/22"
  description = "DevOps LZ VNet Range"
}

variable "Cura_Staging_VNet_Range" {
  type        = string
  default     = "10.201.128.0/18"
  description = "Curator Staging VNet Range"
}

variable "Cura_Prod_VNet_Range" {
  type        = string
  default     = "10.201.64.0/18"
  description = "Curator Prod VNet Range"
}

##-----------DNS Resolver---------------

variable "Hub_DnsResolver_Name" {
  type        = string
  default     = "cgteunhubdnsresolver"
  description = "DNS Resolver"
}

variable "Hub_DnsResolver_Inbound_Name" {
  type        = string
  default     = "cgteunhubdnsresolver-inbound"
  description = "DNS Resolver Inbound"
}

variable "Hub_DnsResolver_Outbound_Name" {
  type        = string
  default     = "cgteunhubdnsresolver-outbound"
  description = "DNS Resolver Outbound"
}

##-----------Azure Firewall---------------

variable "hub_azurefirewall_name" {
  type        = string
  default     = "cgt-eun-hub-azfw01"
  description = "azure firewall name"
}

variable "hub_azurefirewall_publicip_prefix_name" {
  type        = string
  default     = "cgt-eun-hub-azfw-pip-prefix"
  description = "azure firewall public ip prefix name"
}

variable "hub_azurefirewall_publicip_name" {
  type        = string
  default     = "cgt-eun-hub-azfw-pip01"
  description = "azure firewall public ip name"
}

variable "hub_azurefirewall_rootpolicy_name" {
  type        = string
  default     = "cgt-eun-hub-azfw-root-policy"
  description = "azure firewall root policy name"
}

variable "hub_azurefirewall_childpolicy_name" {
  type        = string
  default     = "cgt-eun-hub-azfw-policy"
  description = "azure firewall child policy name"
}

variable "hub_azurefirewall_rcg_name" {
  type        = string
  default     = "hub_childpolicy_rcg"
  description = "azure firewall policy rule collection group name"
}

variable "hub_azurefirewall_sku_tier" {
  type        = string
  description = "azure firewall SKU tier"
  default     = "Standard"
}

variable "hub_azurefirewall_sku_name" {
  type        = string
  description = "azure firewall SKU tier"
  default     = "AZFW_VNet"
}

variable "hub_azurefirewall_zones" {
  type        = list(string)
  description = "Firewall zones"
  default     = ["1", "2", "3"]
}

variable "hub_azurefirewall_net_rules" {
  type        = map(any)
  description = "Azure firewall network rules"
  default     = {}
}

variable "hub_azurefirewall_nat_rules" {
  type        = map(any)
  description = "Azure firewall NAT rules"
  default     = {}
}

variable "hub_azurefirewall_app_rules" {
  type        = map(any)
  description = "Azure firewall Application rules"
  default     = {}
}

variable "hub_azurefirewall_publicip_prefix_lenght" {
  type        = number
  description = "Azure firewall public IP prefix"
  default     = 29
}

variable "hub_azurefirewall_public_ips" {
  type        = map(any)
  description = "Azure firewall Public IPs to be created"
  default     = {}
}

##-----------Jumpbox VM-------------------------

variable "JumpboxVM_Name" {
  type    = string
  default = "CGTEUNJB01"
}

##-----------Hub Bastion---------------

variable "Hub_AzureBastion_PublicIP_Name" {
  type        = string
  default     = "cgt-eun-hub-bastion-pip01"
  description = "Azure Bastion Public IP"
}

variable "Hub_AzureBastion_Name" {
  type        = string
  default     = "cgt-eun-hub-bastion01"
  description = "Azure Bastion Name"
}

##-----------Key Vault-------------------------

variable "Hub_KeyVault_Name" {
  type    = string
  default = "cgt-eun-hub-kv"
}

variable "Mgmt_KeyVault_Name" {
  type    = string
  default = "cgt-eun-mgmt-kv"
}

##-----------Azure VPN---------------

variable "Hub_AzureVPN_PublicIP_Name" {
  type        = string
  default     = "cgt-eun-hub-vng-pip01"
  description = "Azure VPN Public Ip Name"
}

variable "Hub_AzureVPN_Name" {
  type        = string
  default     = "cgt-eun-hub-vng01"
  description = "Azure VPN Name"
}

variable "Hub_LocalGateway_Name" {
  type        = string
  default     = "cgt-eun-hub-lgw01"
  description = "Azure Local Gateway Name"
}

variable "Hub_LocalGateway_PublicIP_Address" {
  type        = string
  default     = "192.168.0.0"
  description = "Azure Local Gateway Public IP Address"
}

variable "Hub_LocalGateway_IPAddress_Range" {
  type        = string
  default     = "10.0.20.0/24"
  description = "Azure Local Gateway Public IP Address"
}

variable "Hub_AzureVPN_Connection_Name" {
  type        = string
  default     = "cgt-eun-hub-vng01-lgw01-con"
  description = "Azure VPN Connection Name"
}


##-----------Connectivity Sub Budget---------------

variable "Hub_Sub_Budget_Name" {
  type    = string
  default = "Connectivity-Sub-budget01"
}

variable "Hub_Sub_Budget_Email_Receiver" {
  type    = string
  default = "sre@carnegroup.com"
}

##-----------Management Sub Budget---------------

variable "MGMT_Sub_Budget_Name" {
  type    = string
  default = "Management-Sub-budget01"
}

variable "MGMT_Sub_Budget_Email_Receiver" {
  type    = string
  default = "sre@carnegroup.com"
}

##-----------Curator Staging Sub Budget---------------

variable "Cura_Staging_Sub_Budget_Name" {
  type    = string
  default = "Cura-Staging-Sub-budget01"
}

variable "Cura_Staging_Sub_Budget_Email_Receiver" {
  type    = string
  default = "sre@carnegroup.com"
}

##-----------Curator Prod Sub Budget---------------

variable "Cura_Prod_Sub_Budget_Name" {
  type    = string
  default = "Cura-Prod-Sub-budget01"
}

variable "Cura_Prod_Sub_Budget_Email_Receiver" {
  type    = string
  default = "sre@carnegroup.com"
}


##-----------Application Gateway-------------------------

variable "Hub_AppGW_Name" {
  type        = string
  default     = "cgt-eun-hub-appgw01"
  description = "App Gateway Name"
}

variable "Hub_AppGW_PublicIP_Name" {
  type        = string
  default     = "cgt-eun-hub-appgw-pip01"
  description = "App Gateway Public IP Name"
}

variable "Hub_AppGW_Backend_Address_Pool_Name" {
  type    = string
  default = "BackendPool-1"
}

variable "Hub_AppGW_Frontend_Port_Name" {
  type    = string
  default = "FrontendPort"
}

variable "Hub_AppGW_Frontend_IP_Configuration_Name" {
  type    = string
  default = "AGIPConfig"
}

variable "Hub_AppGW_HTTP_Setting_Name" {
  type    = string
  default = "HTTPsetting"
}

variable "Hub_AppGW_Listener_Name" {
  type    = string
  default = "Listener"
}

variable "Hub_AppGW_Request_Routing_Rule_Name" {
  type    = string
  default = "RoutingRule"
}

##-----------Management Azure Container Registry---------------

variable "MGMT_ACR_Name" {
  type        = string
  default     = "cgteunmgmtacr01"
  description = "MGMT ACR Name"
}

##-----------Manegement Log Analytics WorkSpace---------------

variable "MGMT_LAW_Name" {
  type    = string
  default = "cgt-eun-mgmt-law01"
}

##-----------Recovery Services Vault-------------------------

variable "MGMT_RecoveryServicesVault_Name" {
  type    = string
  default = "cgt-eun-mgmt-bck-vault01"
}


##------------ Variables for Platform LZ------------------------------------------
variable "tenant_name" {
  type        = string
  default     = "CarneGroupTech"
  description = "Tenancy Name"
}
variable "tenant_short_name" {
  type        = string
  default     = "CGT"
  description = "Tenancy Short Name"
}
variable "prefix" {
  type        = string
  default     = "cgt"
  description = "Unique prefix to mark deployments with. Use to deploy environments for dev or testing."
}

##-----------Convenience Variables---------------

variable "vm_size_sku" {
  description = "A small list of skus - for more options see https://learn.microsoft.com/en-us/azure/azure-resource-manager/troubleshooting/error-sku-not-available?tabs=azure-cli"
  type        = map(string)
  default = {
    Standard_F2      = "Standard_F2"
    Standard_F8      = "Standard_F8"
    Standard_A1_v2   = "Standard_A1_v2"
    Standard_A8m_v2  = "Standard_A8m_v2"
    Standard_B4ms    = "Standard_B4ms"
    Standard_B12ms   = "Standard_B12ms"
    Standard_D1_v2   = "Standard_D1_v2"
    Standard_DS2_v2  = "Standard_DS2_v2"
    Standard_D16s_v5 = "Standard_D16s_v5"
  }
}
