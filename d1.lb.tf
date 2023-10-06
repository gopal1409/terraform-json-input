resource "azurerm_public_ip" "web_lb_publicip" {
    name                            = "${local.resurce_name_prefix}-lb-publicip"
  location                        = azurerm_resource_group.myrg1.location
  resource_group_name             = azurerm_resource_group.myrg1.name
  allocation_method = "Static"
  sku = "Standard"
  tags = local.common_tags
}

##create the lb
resource "azurerm_lb" "web_lb" {
     name                            = "${local.resurce_name_prefix}-web-lb"
  location                        = azurerm_resource_group.myrg1.location
  resource_group_name             = azurerm_resource_group.myrg1.name
  sku = "Standard"
  frontend_ip_configuration {
    name = "web-lb-public-ip"
    public_ip_address_id = azurerm_public_ip.web_lb_publicip.id
  }
  
}

##create lb backend pool
resource "azurerm_lb_backend_address_pool" "web_lb_backend_address_pool" {
  name = "web-backend"
  loadbalancer_id = azurerm_lb.web_lb.id
}

##we will create the health checkup
resource "azurerm_lb_probe" "web_lb_probe" {
  name = "tcp-probe"
  protocol = "Tcp"
  port = 80
  loadbalancer_id = azurerm_lb.web_lb.id 
}

resource "azurerm_lb_rule" "web_lb_rule" {
  name = "web-app-rule"
  protocol = "Tcp"
  frontend_port = 80
  backend_port = 80
  frontend_ip_configuration_name = azurerm_lb.web_lb.frontend_ip_configuration[0].name 
  backend_address_pool_ids = [azurerm_lb_backend_address_pool.web_lb_backend_address_pool.id]
  probe_id = azurerm_lb_probe.web_lb_probe.id 
  loadbalancer_id = azurerm_lb.web_lb.id 
}

##we will assocaite the network interface with stadnadard alb
resource "azurerm_network_interface_backend_address_pool_association" "web_nic_lb_associate" {
for_each = var.web_linux_instance_count
  network_interface_id = azurerm_network_interface.web_linux_nic[each.key].id
  ip_configuration_name = azurerm_network_interface.web_linux_nic[each.key].ip_configuration[0].name
  backend_address_pool_id = azurerm_lb_backend_address_pool.web_lb_backend_address_pool.id
}