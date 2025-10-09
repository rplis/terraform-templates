terraform {
required_providers {
 azurerm = {
  source = "hashicorp/azurerm"
 }
}
}


resource "azurerm_container_app_environment" "env" {
name = "${var.name_prefix}-acae"
location = var.location
resource_group_name = var.rg_name
log_analytics_workspace_id = var.law_id
tags = var.tags

infrastructure_subnet_id = var.infrastructure_subnet_id
}