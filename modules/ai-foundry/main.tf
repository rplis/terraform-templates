terraform {
  required_providers {
    azurerm = {
      source  = "azurerm"
      version = "4.40.0"
    }
  }
}

provider "azurerm" {
  features {}
}

# Azure AI Foundry (Cognitive Services Account)
resource "azurerm_cognitive_account" "ai_foundry" {
  name                = "ai-haba-legal-${var.environment}"
  location            = var.location
  resource_group_name = var.resource_group_name
  kind                = "CognitiveServices"
  sku_name            = "S0"
  public_network_access_enabled = true
}


