terraform {
required_providers { azurerm = { source = "hashicorp/azurerm" } }
}


resource "azurerm_key_vault" "kv" {
name = replace("${var.name_prefix}kv", "-", "")
location = var.location
resource_group_name = var.rg_name
tenant_id = var.tenant_id
sku_name = var.sku_name
purge_protection_enabled = true
soft_delete_retention_days = 7
public_network_access_enabled = true
tags = var.tags
}