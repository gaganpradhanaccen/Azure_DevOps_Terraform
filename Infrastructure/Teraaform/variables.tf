# Common
variable "airid" {
  description = "Accenture CIO 'AIRID' tag. Changing this forces a new resource to be created."
  type        = string
}

# Resource Group
// variable "resource-group__subscription_id" {
//   description = "Subscription ID where the resource group will be created."
//   type        = string
//   default     = ""
// }
// variable "resource-group__resource_group_location" {
//   description = "Azure region where the resource group will be created."
//   type        = string
//   default     = "eastus2"
// }
// variable "resource-group__resource_group_app_name" {
//   description = "Application name that the resource group is being created for."
//   type        = string
// }
// variable "resource-group__environment" {
//   description = "Accenture CIO 'Environment' tag. Changing this forces a new resource to be created."
//   type        = string
// }

#Function APP
variable "environment" {
  description = "Accenture CIO 'Environment' tag. Changing this forces a new resource to be created."
  type        = string
  default     = ""
}

variable "location" {
  description = "Azure location/region"
  type        = string
  default     = ""
}

variable "zip_file" {
  type        = string
  description = "zip file name which need to be uploaded"
}

variable "resource_group_name" {
  description = "Resource Group Name"
  type        = string
}

variable "function_language" {
  description = "Language of the Function App, can be \"dotnet\", \"node\" or \"python\""
  type        = string
  default     = "dotnet"
}

variable "plan_sku" {
  description = "The SKU for the plan. Possible values include B1, B2, B3, D1, F1, I1, I2, I3, I1v2, I2v2, I3v2, I4v2, I5v2, I6v2, P1v2, P2v2, P3v2, P0v3, P1v3, P2v3, P3v3, P1mv3, P2mv3, P3mv3, P4mv3, P5mv3, S1, S2, S3, SHARED, EP1, EP2, EP3, WS1, WS2, WS3, and Y1."
  type        = string
  default     = "Y1"
}

variable "auth_client_id" {
  type        = string
  description = "Azure AAD Authentication's client ID which need to be added"
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


variable "python_version" {
  description = "The version of Python to run. Possible values are 3.12, 3.11, 3.10, 3.9, 3.8 and 3.7"
  type        = string
  default     = null
}


variable "cors_input" {
  description = "It will add the CORS entity"
  type = object({
    allowed_origins     = list(string)
    support_credentials = bool
  })
  default = {
    allowed_origins     = ["https://accenture.com"]
    support_credentials = false
  }
}

variable "min_tls_cipher_suite" {
  description = "Configure minimum TLS Cipher Suite. All incoming requests from clients that only support TLS Cipher Suites less secure than the set minimum will be rejected by the front-end. This is only available for Premium App Service Plans."
  type        = string
  default     = null
}

#Role Assignment
variable "service_principal_name" {
  description = "Name of system assigned managed identity"
  type        = string
  default     = null
}
