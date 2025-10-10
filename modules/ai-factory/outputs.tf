output "ai_service_id" {
  value = azurerm_ai_services.ai_service.id
}

output "ai_service_name" {
  value = azurerm_ai_services.ai_service.name
}

output "primary_access_key" {
  value     = azurerm_ai_services.ai_service.primary_access_key
  sensitive = true
}

output "secondary_access_key" {
  value     = azurerm_ai_services.ai_service.secondary_access_key
  sensitive = true
}

output "endpoint" {
  value = azurerm_ai_services.ai_service.endpoint
}

