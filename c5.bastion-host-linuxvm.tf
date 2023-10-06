/*##we will provide public ip to bastion host
resource "azurerm_public_ip" "bastion_host_publicip" {
  name                = "${local.resurce_name_prefix}-bastion-host-publicip"
  location            = azurerm_resource_group.myrg1.location
  resource_group_name = azurerm_resource_group.myrg1.name

  allocation_method = "Static"
  sku               = "Standard"
  # domain_name_label = "app1-vm"

}
#create network interface for bastion host

resource "azurerm_network_interface" "bastion_host_linuxvm_nic" {
 
  name                = "${local.resurce_name_prefix}-web-bastion-host-linuxvm-nic"
  location            = azurerm_resource_group.myrg1.location
  resource_group_name = azurerm_resource_group.myrg1.name
  ip_configuration {
    name                          = "bastion-linuxip-1"
    subnet_id                     = azurerm_subnet.bastionsubnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.bastion_host_publicip.id 
  }
}

resource "azurerm_linux_virtual_machine" "bastion_linux_vm" {
  
  name                            = "${local.resurce_name_prefix}-bastion-linuxvm"
  location                        = azurerm_resource_group.myrg1.location
  resource_group_name             = azurerm_resource_group.myrg1.name
  size                            = "Standard_DS1_v2"
  admin_username                  = "azureuser"
  admin_password                  = var.adminpw
  disable_password_authentication = false
  network_interface_ids           = [azurerm_network_interface.bastion_host_linuxvm_nic.id]
  /*admin_ssh_key {
    username = "azureuser"
    ##path.module is the root directory it is like callign your current directory
    public_key = file("${path.module}/ssh-keys/terraform-azure.pem.pub")
  }
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts"
    version   = "latest"
  }
  ###to execute the boot strap script
  #custom_data = base64encode(local.webvm_custom_data)
  #if you boot strap data is in inside a file in shell format
  #custom_data = filebase64("${path.module}/app/app.sh")
}
*/