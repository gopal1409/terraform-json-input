output "web_lb_publicip" {
  description = "web load balancer public ip"
  value = azurerm_public_ip.web_lb_publicip.ip_address
}