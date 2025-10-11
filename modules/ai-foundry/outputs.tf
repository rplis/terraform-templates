output "ai_services_id" {
  value = azurerm_ai_services.ai_foundry.id
}

output "ai_services_name" {
  value = azurerm_ai_services.ai_foundry.name
}

output "primary_access_key" {
  value     = azurerm_ai_services.ai_foundry.primary_access_key
  sensitive = true
}

output "secondary_access_key" {
  value     = azurerm_ai_services.ai_foundry.secondary_access_key
  sensitive = true
}

output "endpoint" {
  value = azurerm_ai_services.ai_foundry.endpoint
}

output "custom_subdomain_name" {
  value = azurerm_ai_services.ai_foundry.custom_subdomain_name
}

output "fqdns" {
  value = azurerm_ai_services.ai_foundry.fqdns
}

