output "vnet_id" { value = azurerm_virtual_network.vnet.id }
output "subnets" { value = { for k, s in azurerm_subnet.subnets : k => s } }