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

# Azure AI Foundry Hub implemented via Machine Learning workspace with kind = "hub"
resource "azapi_resource" "ai_hub" {
  type      = "Microsoft.MachineLearningServices/workspaces@2024-04-01"
  name      = "${var.name_prefix}-aihub"
  location  = var.location
  parent_id = data.azurerm_resource_group.rg.id

  body = jsonencode({
    properties = {
      friendlyName = var.hub_friendly_name
      description  = var.hub_description
      publicNetworkAccess = var.hub_public_network_access
      encryption = var.hub_cmk_key_id == null ? null : {
        keyVaultProperties = {
          keyIdentifier = var.hub_cmk_key_id
        }
      }
    }
    kind = "hub"
    tags = var.tags
  })
}

# Default Project under the Hub
resource "azapi_resource" "ai_project" {
  type      = "Microsoft.MachineLearningServices/workspaces/projects@2024-04-01"
  name      = var.default_project_name
  parent_id = azapi_resource.ai_hub.id

  body = jsonencode({
    properties = {
      description = var.project_description
    }
    tags = var.tags
  })
}


