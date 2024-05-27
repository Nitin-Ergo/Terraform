<#
.SYNOPSIS

Tusla Terraform AVD Azure Landing Zone initial configuration powershell script.

.DESCRIPTION

This script deploys the Azure resources and initial configuration required to run the Terraform
AVD Azure Landing Zone templates.

.INPUTS

Update the Variables

.OUTPUTS

 A new Resource Group, Storage Account and Container, Key Vault, RBAC Permissions, Tenant ID.

.NOTES

    Author : Nitin Gupta
    Version : 1.0 
    Purpose : Terraform AVD Azure Landing Zone Initial Configurations
    PowerShell Version : 5.1
    Date : 27/05/2024
#>

$ErrorActionPreference = "Stop"

################################
## Update the variables below ##
################################

## Update the existing AVD Subscription Name
$SubscriptionName = "LZ_Corp_AzureVirtualDesktop_Production"

$ResourceGroupName = "rg-avd-prod-terraform" ## A new Resource Group name to be created
$location = "northeurope"  ## Location of Azure resources

$storageaccountname = "strtuslaavdterraform" ## A new Storage Account name
$sku = "Standard_LRS"
$containername = "terraformavdalzstate" ## A new Container Name to store terraform state file

## Update Object ID of the user running this script and DevOps SP Client ID use to deploy terraform templates.

$devopsSPClientID = ""

## Connect to Azure Tenant

Connect-AzAccount -TenantId $TenantID

## Set Subscription

Select-AzSubscription -SubscriptionName $SubscriptionName

## Create New Resource Group

New-AzResourceGroup -Name $ResourceGroupName -Location $location

## Create new Storage Account and container

New-AzStorageAccount -ResourceGroupName $ResourceGroupName -Name $storageaccountname -Location $location -SkuName $sku
New-AzRoleAssignment -ObjectId $userobjectID -RoleDefinitionName "Storage Account Contributor" -ResourceGroupName $ResourceGroupName

# Create a context object using Azure AD credentials
$storageContext = New-AzStorageContext -StorageAccountName $storageaccountname -UseConnectedAccount

New-AzStorageContainer -Name $containername -Permission Off -Context $storageContext