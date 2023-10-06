output "web_linuxvm_public_ip" {
  description = "Web Linux VM public Address"
  value       = [for vm in azurerm_linux_virtual_machine.web_linux_vm: vm.public_ip_address]
}