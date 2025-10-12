terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.40.0"
    }
  }
}


locals {
  acr_name = replace("${var.company}-${var.project}-${var.environment}-acr", "-", "")
}

resource "azurerm_container_registry" "acr" {
  name                = local.acr_name
  resource_group_name = var.rg_name
  location            = var.location
  sku                 = var.sku
  admin_enabled       = var.admin_enabled
  tags                = var.tags
}