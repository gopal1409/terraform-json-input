locals {
  webvm_custom_data = <<CUSTOM_DATA
#!/bin/sh
sudo apt-get update -y
sudo apt install apache2 -y
sudo echo "Welcome to test - WebVM App1 - VM Hostname: $(hostname)" > /var/www/html/index.html
CUSTOM_DATA
}

resource "azurerm_linux_virtual_machine" "web_linux_vm" {
  for_each = var.web_linux_instance_count
  name                            = "${local.resurce_name_prefix}-web-linuxvm-${each.key}"
  location                        = azurerm_resource_group.myrg1.location
  resource_group_name             = azurerm_resource_group.myrg1.name
  size                            = "Standard_B1s"
  admin_username                  = "azureuser"
  #admin_password                  = var.adminpw
  #disable_password_authentication = false
  network_interface_ids           = [azurerm_network_interface.web_linux_nic[each.key].id]
  admin_ssh_key {
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
  custom_data = base64encode(local.webvm_custom_data)
  #if you boot strap data is in inside a file in shell format
  #custom_data = filebase64("${path.module}/app/app.sh")
}