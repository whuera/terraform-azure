# main
provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "grupo_recursos" {
  name     = "rg_terraformg1"
  location = "East US"
}

resource "azurerm_service_plan" "appserviceplan" {
  name                = "app_plang1"
  resource_group_name = azurerm_resource_group.grupo_recursos.name
  location            = azurerm_resource_group.grupo_recursos.location
  #sku_name            = "P1v2"
  sku_name            = "S1"
  os_type             = "Windows"
}

resource "azurerm_windows_web_app" "webapp" {
  name                = "webapp-wh"
  resource_group_name = azurerm_resource_group.grupo_recursos.name
  location            = azurerm_service_plan.appserviceplan.location
  service_plan_id     = azurerm_service_plan.appserviceplan.id

  site_config {}
}