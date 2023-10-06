resource "azurerm_virtual_network" "vnet" {
  name                = "${local.resurce_name_prefix}-${var.vnet_name}"
  address_space       = var.vnet_address_space
  location            = azurerm_resource_group.myrg1.location
  resource_group_name = azurerm_resource_group.myrg1.name
  tags                = local.common_tags
}