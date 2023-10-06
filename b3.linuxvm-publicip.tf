/*resource "azurerm_public_ip" "web_linux_publicip" {
  name                = "${local.resurce_name_prefix}-web-linuxvm-publicip"
  location            = azurerm_resource_group.myrg1.location
  resource_group_name = azurerm_resource_group.myrg1.name

  allocation_method = "Static"
  sku               = "Standard"
  # domain_name_label = "app1-vm"

}*/