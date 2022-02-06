output "network_id" {
  value = data.google_compute_network.my_network.id

}

output "vm_id" {
  value = google_compute_instance.vm_instance.*.id

}


output "vm_detail" {
  value = google_compute_instance.vm_instance
  sensitive = true
}

output "vm_ip" {

  value = google_compute_instance.vm_instance.*.network_interface.0.network_ip

}
