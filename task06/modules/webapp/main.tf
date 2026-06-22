resource "azurerm_service_plan" "main" {
  name                = var.asp_name
  resource_group_name = var.resource_group_name
  location            = var.location
  os_type             = "Linux"
  sku_name            = var.asp_sku

  tags = var.tags
}

resource "azurerm_linux_web_app" "main" {
  name                = var.app_name
  resource_group_name = var.resource_group_name
  location            = var.location
  service_plan_id     = azurerm_service_plan.main.id
  https_only          = true

  site_config {
    always_on = true

    application_stack {
      dotnet_version = var.app_dotnet_version
    }
  }

  app_settings = {
    "ConnectionStrings__DefaultConnection" = var.sql_connection_string
  }

  connection_string {
    name  = "DefaultConnection"
    type  = "SQLAzure"
    value = var.sql_connection_string
  }

  tags = var.tags
}
