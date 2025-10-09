terraform {
  required_providers {
    azurerm = { source = "hashicorp/azurerm", version = "~> 3.120" }
  }
}

provider "azurerm" { features {} }

resource "azurerm_resource_group" "rg" {
  name     = "ai-factory-minimal-rg"
  location = "westeurope"
}

module "ai-factory" {
  source      = "git::https://github.com/<org>/azure-tf-catalog//modules/ai-factory?ref=v0.2.0"
  rg_name     = azurerm_resource_group.rg.name
  location    = azurerm_resource_group.rg.location
  name_prefix = "demo"
  default_project_name = "firstProject"
  tags = {
    project      = "demo"
    env          = "dev"
    owner        = "example"
    generated-by = "ai"
  }
}


