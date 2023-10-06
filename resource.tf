resource "azurerm_resource_group" "myrg1" {
  name = "${local.resurce_name_prefix}-${var.resource_group_name}-${random_string.myrandom.id}"
  #sap-dev-rg-default
  location = var.resource_group_location
}
/*
resource "azurerm_resource_group" "myrg2" {
  name = "myrg-3"
  location = "West Us"
  provider = azurerm.provider2-westus
  ###provider.alias name
}*/