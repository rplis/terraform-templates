terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.40.0"
    }
  }
}


resource "azurerm_resource_group" "rg" {
name = var.rg_name
location = var.location
tags = var.tags
}


locals {
  law_name = "law-${var.company}-${var.project}-${var.environment}"
}

resource "azurerm_log_analytics_workspace" "law" {
  name                = local.law_name
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  sku                 = "PerGB2018"
  retention_in_days   = var.log_retention_days
  tags                = var.tags
}


// Temporarily disabled until diagnostics for resource groups are confirmed
// resource "azurerm_monitor_diagnostic_setting" "rg_diag" {
// name = "${var.name_prefix}-rg-diag"
// target_resource_id = azurerm_resource_group.rg.id
// log_analytics_workspace_id = azurerm_log_analytics_workspace.law.id
//
// enabled_log {
// category = "Administrative"
// }
// enabled_metric {
// category = "AllMetrics"
// }
// }