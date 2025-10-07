
# Resource Group
variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The Azure location where the resource group will be created"
  type        = string
}

#Function APP

variable "function_app_name" {
  description = "The name of the Azure Function App."
  type        = string
}

variable "storage_account_name" {
  description = "The name of the storage account for the Function App."
  type        = string
}

variable "app_service_plan_id" {
  description = "The ID of the App Service Plan to be used by the Function App."
  type        = string
}

variable "function_language" {
  description = "Language of the Function App, can be \"dotnet\", \"node\" or \"python\""
  type        = string
  default     = "dotnet"
}


variable "auth_allowed_audiences" {
  description = "Authorization Allowed Audiences For the Function App"
  type        = list(any)
  default     = [] # Linux or Windows
}

variable "always_on" {
  description = "Should the Function App be loaded at all times? Defaults to false"
  type        = string
  default     = false
}

variable "os_type" {
  description = "Definition of the dedicated plan to use"
  type        = string
  default     = "Windows" # Linux or Windows
}

variable "function_app_application_settings" {
  description = "Function App application settings"
  type        = map(string)
  default     = {}
}


variable "runtime_version" {
  description = "The runtime version associated with the Function App. Defaults to ~1"
  type        = string
  default     = "~1"
}


variable "function_name" {
  description = "The name of the Function App to be created. It will be prefixed according to the CIO naming convention. Changing this value forces the creation of a new resource."
  type        = string
  default     = ""
}

# Azure SQL Database

variable "sql_server_name" {
  description = "The name of the Azure SQL Server."
  type        = string
}

variable "sql_database_name" {
  description = "The name of the Azure SQL Database."
  type        = string
}

variable "location" {
  description = "The Azure location where the resources will be created."
  type        = string
}

variable "admin_username" {
  description = "The administrator username for the SQL Server."
  type        = string
}

variable "admin_password" {
  description = "The administrator password for the SQL Server."
  type        = string
  sensitive   = true
}


#Role Assignment
variable "function_app_id" {
  description = "The ID of the Azure Function App"
  type        = string
}

variable "sql_server_id" {
  description = "The ID of the Azure SQL Server"
  type        = string
}

variable "role_definition_name" {
  description = "The role definition name for the role assignment"
  type        = string
}

variable "function_app_principal_id" {
  description = "The principal ID of the Function App"
  type        = string
}
