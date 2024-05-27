terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.29.1"
    }
  }
  backend "azurerm" {
    subscription_id      = "3812a3bd-570e-49b6-a281-2536a3fa0318"
    resource_group_name  = "rg-avd-prod-terraform"
    storage_account_name = "strtuslaavdterraform"
    container_name       = "terraformavdalzstate"
    key                  = "avdalzterraform.tfstate"
  }
}

provider "azurerm" {
  alias           = "connectivity-sub"
  subscription_id = var.Connectivity_Sub_Id
  features {}
}

provider "azurerm" {
  alias           = "avd-sub"
  subscription_id = var.AVD_Sub_Id
  features {}
}