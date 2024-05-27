terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.29.1"
    }
  }
  backend "azurerm" {
    subscription_id      = "0126eaae-6d5f-4884-8c38-110c48afa86a"
    resource_group_name  = "cgt-eun-mgmt-terraform-rg"
    storage_account_name = "tuslaeunmgmtterraformsta"
    container_name       = "terraformplatformlzstate"
    key                  = "platformlzterraform.tfstate"
  }
}

provider "azurerm" {
  subscription_id = var.MGMT_Sub_Id
  features {}
}

provider "azurerm" {
  alias           = "connectivity-sub"
  subscription_id = var.Connectivity_Sub_Id
  features {}
}

provider "azurerm" {
  alias           = "management-sub"
  subscription_id = var.MGMT_Sub_Id
  features {}
}

provider "azurerm" {
  alias           = "cura-staging-sub"
  subscription_id = var.Cura_Staging_Sub_Id
  features {}
}

provider "azurerm" {
  alias           = "cura-prod-sub"
  subscription_id = var.Cura_Prod_Sub_Id
  features {}
}