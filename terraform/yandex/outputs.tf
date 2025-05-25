output "internal_ip" {
  description = "Internal IP address of the VM"
  value       = yandex_compute_instance.vm.network_interface[0].ip_address
}

output "external_ip" {
  description = "External NAT IP address of the VM"
  value       = yandex_compute_instance.vm.network_interface[0].nat_ip_address
}
