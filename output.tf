output "virtual_network_name" {
  description = "Vnet Name"
  value       = azurerm_virtual_network.vnet.name
}

output "web_subnet_name_name" {
  description = "Vnet Name"
  value       = azurerm_subnet.websubnet.name
}