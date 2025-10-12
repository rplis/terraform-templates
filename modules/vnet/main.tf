terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.40.0"
    }
  }
}


locals {
  vnet_name = "${var.company}-${var.project}-${var.environment}-vnet"
}

resource "azurerm_virtual_network" "vnet" {
  name                = local.vnet_name
  location            = var.location
  resource_group_name = var.rg_name
  address_space       = [var.address_space]
  tags                = var.tags
}


resource "azurerm_subnet" "subnets" {
for_each = var.subnets
name = each.key
resource_group_name = var.rg_name
virtual_network_name = azurerm_virtual_network.vnet.name
address_prefixes = [each.value]
}