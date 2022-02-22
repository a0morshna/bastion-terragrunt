resource "google_compute_firewall" "allow_iap_to_bastion" {
    project    = var.project_name
    name       = var.firewall_name_iap
    network    = var.network
    priority   = var.priority

    allow {
        protocol = var.protocol_name_iap
        ports    = var.protocol_iap_ports

    }

    direction     = var.iap_direction
    source_ranges = var.iap_source_ranges
}


resource "google_compute_firewall" "allow_access_from_bastion" {
    project  = var.project_name
    name     = var.firewall_access_bastion
    network  = var.network
    priority = var.priority

    allow {
        protocol = var.allow_access_protocol_name
    }

    allow {
        protocol = var.protocol_name_iap
        ports    = var.tcp_ports
    }

    source_tags = [var.tag]
}


resource "google_compute_firewall" "compute_firewall_all_egress" {
  name               = var.firewall_egress_name
  project            = var.project_name
  network            = var.network

  priority           = var.priority
  direction          = var.firewall_egress_direction
  destination_ranges = var.destination_ranges

  allow {
    protocol = var.firewall_egress_protocol
  }

  target_tags = [var.tag]
}