data "azurerm_client_config" "this" {}

module "myfunction" {
  source                            = "/function-app/azure"
  version                           = "2.0.3"
  airid                             = var.airid
  environment                       = var.environment
  location                          = var.location
  function_name                     = var.function_name
  zip_file                          = var.zip_file
  resource_group                    = var.resource_group_name
  function_language                 = var.function_language
  plan_sku                          = var.plan_sku
  auth_client_id                    = var.auth_client_id
  auth_allowed_audiences            = var.auth_allowed_audiences
  always_on                         = var.always_on
  os_type                           = var.os_type
  function_app_application_settings = var.function_app_application_settings
  runtime_version                   = var.runtime_version
  python_version                    = var.python_version
  cors_input                        = var.cors_input
  min_tls_cipher_suite              = var.min_tls_cipher_suite
}



module "role_assignment_1" {
  source                 = "/role-assignment/azure"
  version                = "3.0.0"
  service_principal_name = var.service_principal_name
  user_added_role        = "Key Vault Administrator"
  depends_on             = [module.myfunction]
  #skip_service_principal_aad_check = true
}

