terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.40.0"
    }
  }
}



locals {
  acae_name = "env-${var.company}-${var.project}-${var.environment}"
}

resource "azurerm_container_app_environment" "env" {
  name                         = local.acae_name
  location                     = var.location
  resource_group_name          = var.rg_name
  log_analytics_workspace_id   = var.law_id
  tags                         = var.tags
  infrastructure_subnet_id     = var.infrastructure_subnet_id
}