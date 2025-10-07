// Resource Group
resource "azurerm_resource_group" "this" {
  name     = var.resource_group_name
  location = var.location
}

output "resource_group_id" {
  value = azurerm_resource_group.this.id
}
// function app

resource "azurerm_function_app" "function_app" {
  name                       = var.function_app_name
  location                   = var.location
  resource_group_name        = var.resource_group_name
  app_service_plan_id        = azurerm_app_service_plan.function_app_service_plan.id
  storage_account_name       = azurerm_storage_account.function_app_storage_account.name
  storage_account_access_key = azurerm_storage_account.function_app_storage_account.primary_access_key
  version                    = "~3"
  os_type                    = "linux"

  identity {
    type = "SystemAssigned"
  }

  app_settings = {
    "AzureWebJobsStorage" = azurerm_storage_account.function_app_storage_account.primary_connection_string
    "FUNCTIONS_WORKER_RUNTIME" = "dotnet"
  }
}

resource "azurerm_app_service_plan" "function_app_service_plan" {
  name                = "${var.function_app_name}-plan"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku {
    tier     = "Dynamic"
    size     = "Y1"
  }
}

resource "azurerm_storage_account" "function_app_storage_account" {
  name                     = "${var.function_app_name}storage"
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier            = "Standard"
  account_replication_type = "LRS"
}

output "function_app_id" {
  value = azurerm_function_app.function_app.id
}

output "function_app_default_hostname" {
  value = azurerm_function_app.function_app.default_hostname
}

# Azure SQL Database
resource "azurerm_sql_server" "sql_server" {
  name                         = var.sql_server_name
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = "12.0"
  administrator_login          = var.sql_admin_username
  administrator_login_password = var.sql_admin_password
}

resource "azurerm_sql_database" "example" {
  name                = var.database_name
  resource_group_name = var.resource_group_name
  location            = var.location
  server_name         = azurerm_sql_server.example.name
  requested_service_objective_name = "S0"
}

output "sql_server_id" {
  value = azurerm_sql_server.example.id
}

output "sql_database_id" {
  value = azurerm_sql_database.example.id
}
# Role Assignment
resource "azurerm_role_assignment" "function_app_sql_access" {
  principal_id   = var.function_app_principal_id
  role_definition_name = "Contributor"
  scope          = azurerm_sql_database.example.id
}

