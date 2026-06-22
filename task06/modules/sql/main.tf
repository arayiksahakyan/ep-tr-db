resource "random_password" "sql_admin" {
  length           = 20
  special          = true
  min_lower        = 1
  min_upper        = 1
  min_numeric      = 1
  min_special      = 1
  override_special = "!#$%&*()-_+"
}

resource "azurerm_mssql_server" "main" {
  name                          = var.sql_server_name
  resource_group_name           = var.resource_group_name
  location                      = var.location
  version                       = "12.0"
  administrator_login           = var.sql_admin_username
  administrator_login_password  = random_password.sql_admin.result
  minimum_tls_version           = "1.2"
  public_network_access_enabled = true

  tags = var.tags
}

resource "azurerm_mssql_database" "main" {
  name      = var.sql_db_name
  server_id = azurerm_mssql_server.main.id
  sku_name  = var.sql_sku

  tags = var.tags
}

resource "azurerm_mssql_firewall_rule" "azure_services" {
  name             = "allow-azure-services"
  server_id        = azurerm_mssql_server.main.id
  start_ip_address = "0.0.0.0"
  end_ip_address   = "0.0.0.0"
}

resource "azurerm_mssql_firewall_rule" "allowed_ip" {
  name             = var.sql_fwr_name
  server_id        = azurerm_mssql_server.main.id
  start_ip_address = var.allowed_ip_address
  end_ip_address   = var.allowed_ip_address
}

resource "azurerm_key_vault_secret" "sql_admin_username" {
  name         = var.sql_admin_secret_name
  value        = var.sql_admin_username
  key_vault_id = var.key_vault_id

  tags = var.tags
}

resource "azurerm_key_vault_secret" "sql_admin_password" {
  name         = var.sql_admin_secret_password_name
  value        = random_password.sql_admin.result
  key_vault_id = var.key_vault_id

  tags = var.tags
}
