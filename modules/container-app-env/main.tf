terraform {
required_providers { azurerm = { source = "hashicorp/azurerm", version = "~> 3.120" } }
}


resource "azurerm_container_app_environment" "env" {
name = "${var.name_prefix}-acae"
location = var.location
resource_group_name = var.rg_name
log_analytics_workspace_id = var.law_id
tags = var.tags


dynamic "infrastructure_subnet_id" {
for_each = var.infrastructure_subnet_id == null ? [] : [var.infrastructure_subnet_id]
content {}
}
}