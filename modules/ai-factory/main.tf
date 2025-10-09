terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
    azapi = {
      source = "azure/azapi"
    }
  }
}

provider "azurerm" {
  features {}
}

data "azurerm_resource_group" "rg" {
  name = var.rg_name
}

# Azure AI Foundry Cognitive Services account (kind = "AIServices")
resource "azapi_resource" "ai_foundry_account" {
  type      = "Microsoft.CognitiveServices/accounts@2023-05-01"
  name      = var.account_name
  location  = var.location
  parent_id = data.azurerm_resource_group.rg.id

  body = jsonencode({
    sku = {
      name = var.sku_name
    }
    kind = "AIServices"
    properties = {
      publicNetworkAccess = var.public_network_access
      customSubDomainName = var.custom_subdomain_name
      networkAcls = var.enable_network_acls ? {
        defaultAction = var.network_acls_default_action
        virtualNetworkRules = var.virtual_network_rules
        ipRules = var.ip_rules
      } : null
    }
    tags = var.tags
  })
}


