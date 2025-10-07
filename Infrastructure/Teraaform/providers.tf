provider "azurerm" {
  features {
    key_vault {
      recover_soft_deleted_key_vaults = true
    }
  }
  storage_use_azuread = true
}

