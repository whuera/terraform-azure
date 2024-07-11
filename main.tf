# main
# This Terraform configuration file sets up the Azure provider.
# It configures the "azurerm" provider and enables all features.
provider "azurerm" {
  features {}
}

/**
 * Resource Group
 *
 * This resource block defines an Azure Resource Group.
 * It creates a resource group with the specified name and location.
 *
 * @resource {azurerm_resource_group} grupo_recursos
 * @param {string} name - The name of the resource group.
 * @param {string} location - The location where the resource group will be created.
 */
resource "azurerm_resource_group" "grupo_recursos" {
  name     = "rg_terraformg1"
  location = "East US"
}

resource "azurerm_service_plan" "appserviceplan" {
  name                = "app_plang1"
  resource_group_name = azurerm_resource_group.grupo_recursos.name
  location            = azurerm_resource_group.grupo_recursos.location
  #sku_name            = "P1v2"
  sku_name = "S1"
  os_type  = "Windows"
}

resource "azurerm_windows_web_app" "webapp" {
  name                = "webapp-wh"
  resource_group_name = azurerm_resource_group.grupo_recursos.name
  location            = azurerm_service_plan.appserviceplan.location
  service_plan_id     = azurerm_service_plan.appserviceplan.id

  site_config {}
}