output "vm_ip" {
  value = virtualbox_vm.app_vm.network_adapter[0].ip
}
