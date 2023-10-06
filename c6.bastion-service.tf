/*
#azure bastion service resource
resource "azurerm_subnet" "bastion_service_subnet" {
  name = var.bastion_service_subnet_name
  resource_group_name = azurerm_resource_group.myrg1.name 
  virtual_network_name = azurerm_virtual_network.vnet.name 
  address_prefixes = var.bastion_service_address_prefixes
}

resource "azurerm_public_ip" "bastion_service_publicip" {
   name                            = "${local.resurce_name_prefix}-bastion-service-publicip"
  location                        = azurerm_resource_group.myrg1.location
  resource_group_name             = azurerm_resource_group.myrg1.name
  allocation_method = "Static"
  sku = "Standard"
}

##azuire bastion service host 
resource "azurerm_bastion_host" "bastion_host" {
  name                            = "${local.resurce_name_prefix}-bastion-service"
  location                        = azurerm_resource_group.myrg1.location
  resource_group_name             = azurerm_resource_group.myrg1.name
  ip_configuration {
    name = "configure"
    subnet_id = azurerm_subnet.bastion_service_subnet.id 
    public_ip_address_id = azurerm_public_ip.bastion_service_publicip.id
  }
}*/