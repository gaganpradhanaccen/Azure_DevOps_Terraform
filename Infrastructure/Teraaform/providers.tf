terraform {
  backend "azurerm" {}
  required_providers {
    azurerm = "~> 4.0"
    azuread = {
     source  = "hashicorp/azuread"
     version = "~> 3.0"
    }
   }
  }


provider "azurerm" {
  features {
    key_vault {
      recover_soft_deleted_key_vaults = true
    }
  }
  storage_use_azuread = true
}
