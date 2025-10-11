terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.40.0"
    }
  }
}


# Azure AI Foundry (Cognitive Services Account)
resource "azurerm_cognitive_account" "ai_foundry" {
  name                = "ai-${var.name_prefix}-${var.environment}"
  location            = var.location
  resource_group_name = var.rg_name
  kind                = "CognitiveServices"
  sku_name            = "S0"
  public_network_access_enabled = var.public_network_access == "Enabled"
}


