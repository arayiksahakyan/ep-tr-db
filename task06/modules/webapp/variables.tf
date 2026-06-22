variable "location" {
  description = "Azure region for Web App resources."
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name for Web App resources."
  type        = string
}

variable "asp_name" {
  description = "App Service Plan name."
  type        = string
}

variable "asp_sku" {
  description = "App Service Plan SKU."
  type        = string
}

variable "app_name" {
  description = "Linux Web App name."
  type        = string
}

variable "app_dotnet_version" {
  description = "Dotnet runtime version for Linux Web App."
  type        = string
}

variable "sql_connection_string" {
  description = "SQL Database connection string."
  type        = string
  sensitive   = true
}

variable "tags" {
  description = "Tags applied to Web App resources."
  type        = map(string)
}
