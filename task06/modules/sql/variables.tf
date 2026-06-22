variable "location" {
  description = "Azure region for SQL resources."
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name for SQL resources."
  type        = string
}

variable "sql_server_name" {
  description = "Azure SQL Server name."
  type        = string
}

variable "sql_db_name" {
  description = "Azure SQL Database name."
  type        = string
}

variable "sql_sku" {
  description = "Azure SQL Database SKU."
  type        = string
}

variable "sql_fwr_name" {
  description = "SQL firewall rule name for allowed IP."
  type        = string
}

variable "allowed_ip_address" {
  description = "IP address allowed to access SQL Server."
  type        = string
}

variable "sql_admin_username" {
  description = "SQL administrator username."
  type        = string
}

variable "key_vault_id" {
  description = "Existing Key Vault ID."
  type        = string
}

variable "sql_admin_secret_name" {
  description = "Key Vault secret name for SQL admin username."
  type        = string
}

variable "sql_admin_secret_password_name" {
  description = "Key Vault secret name for SQL admin password."
  type        = string
}

variable "tags" {
  description = "Tags applied to SQL resources."
  type        = map(string)
}
