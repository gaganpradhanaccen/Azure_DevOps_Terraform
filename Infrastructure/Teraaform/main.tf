module "resource_group" {
  source = "./module.tf"
  resource_group_name = var.resource_group_name
  location = var.location
}

module "function_app" {
  source = "./module.tf"
  function_app_name = var.function_app_name
  resource_group_name = module.resource_group.name
  location = var.location
}

module "azure_sql" {
  source = "./module.tf"
  sql_server_name = var.sql_server_name
  database_name = var.database_name
  resource_group_name = module.resource_group.name
  location = var.location
}

module "role_assignment" {
  source = "./module.tf"
  function_app_id = module.function_app.id
  sql_server_id = module.azure_sql.id
  role_definition_name = var.role_definition_name
}
