terraform {
required_providers { azurerm = { source = "hashicorp/azurerm", version = "~> 3.120" } }
}


resource "azurerm_virtual_network" "vnet" {
name = "${var.name_prefix}-vnet"
location = var.location
resource_group_name = var.rg_name
address_space = [var.address_space]
tags = var.tags
}


resource "azurerm_subnet" "subnets" {
for_each = var.subnets
name = each.key
resource_group_name = var.rg_name
virtual_network_name = azurerm_virtual_network.vnet.name
address_prefixes = [each.value]
}