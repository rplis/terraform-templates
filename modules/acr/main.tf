terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.40.0"
    }
  }
}


resource "azurerm_container_registry" "acr" {
name = replace("${var.name_prefix}acr", "-", "")
resource_group_name = var.rg_name
location = var.location
sku = var.sku
admin_enabled = var.admin_enabled
tags = var.tags
}