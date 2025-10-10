output "cognitive_account_id" {
  value = azurerm_cognitive_account.ai_foundry.id
}

output "cognitive_account_name" {
  value = azurerm_cognitive_account.ai_foundry.name
}

output "primary_access_key" {
  value     = azurerm_cognitive_account.ai_foundry.primary_access_key
  sensitive = true
}

output "secondary_access_key" {
  value     = azurerm_cognitive_account.ai_foundry.secondary_access_key
  sensitive = true
}

output "endpoint" {
  value = azurerm_cognitive_account.ai_foundry.endpoint
}

