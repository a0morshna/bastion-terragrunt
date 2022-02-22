output "network_name"{
  value = google_compute_network.bastion-network.name 
}

output "subnetwork_name" {
  value = google_compute_subnetwork.bastion-subnet.name
}
