terraform {
  required_providers {
    azurerm = { source = "hashicorp/azurerm" }
  }
}

# Tu zasoby azurerm_* dla nowej usługi
# Unikaj side-effectów i twardych zależności na inne moduły.
