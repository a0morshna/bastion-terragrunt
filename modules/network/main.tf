resource "google_compute_network" "bastion-network" {
  project                 = var.project_id
  name                    = var.network_name
  auto_create_subnetworks = var.create_subnet
  mtu                     = var.mtu
}


resource "google_compute_subnetwork" "bastion-subnet" {
  project       = var.project_id
  name          = var.subnet_name
  region        = var.region
  network       = google_compute_network.bastion-network.name
  ip_cidr_range = var.ip_cidr_range
  depends_on    = [google_compute_network.bastion-network]
}