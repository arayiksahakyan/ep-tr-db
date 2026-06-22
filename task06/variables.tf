variable "location" {
  description = "Azure region where resources will be created."
  type        = string
}

variable "name_prefix" {
  description = "Prefix used to generate resource names."
  type        = string
}

variable "kv_rg_name" {
  description = "Name of the existing resource group containing Key Vault."
  type        = string
}

variable "kv_name" {
  description = "Name of the existing Key Vault."
  type        = string
}

variable "sql_admin_secret_name" {
  description = "Key Vault secret name for SQL admin username."
  type        = string
}

variable "sql_admin_secret_password" {
  description = "Key Vault secret name for SQL admin password."
  type        = string
}

variable "sql_sku" {
  description = "Azure SQL Database SKU."
  type        = string
}

variable "sql_fwr_name" {
  description = "SQL Server firewall rule name for verification agent IP."
  type        = string
}

variable "asp_sku" {
  description = "App Service Plan SKU."
  type        = string
}

variable "app_dotnet_version" {
  description = "Dotnet version for Linux Web App."
  type        = string
}

variable "student_email" {
  description = "Student email used for Creator tag."
  type        = string
}

variable "allowed_ip_address" {
  description = "IP address allowed to connect to Azure SQL Server."
  type        = string
}
