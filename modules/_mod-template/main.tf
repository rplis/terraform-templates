terraform {
  required_providers {
    azurerm = { source = "hashicorp/azurerm", version = "~> 3.120" }
  }
}

# Tu zasoby azurerm_* dla nowej usługi
# Unikaj side-effectów i twardych zależności na inne moduły.
