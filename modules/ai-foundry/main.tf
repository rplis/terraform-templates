terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.40.0"
    }
  }
}


# Azure AI Services
resource "azurerm_ai_services" "ai_foundry" {
  fqdns                              = var.fqdns
  local_authentication_enabled       = var.local_authentication_enabled
  location                           = var.location
  name                               = var.name
  outbound_network_access_restricted = var.outbound_network_access_restricted
  public_network_access              = var.public_network_access
  resource_group_name                = var.rg_name
  sku_name                           = var.sku_name
  tags                               = var.tags

  identity {
    identity_ids = var.identity_ids
    type         = var.identity_type
  }

  network_acls {
    bypass         = var.network_acls_bypass
    default_action = var.network_acls_default_action
    ip_rules       = var.network_acls_ip_rules
  }
}


