provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone 
}


resource "random_integer" "random" {
  min   = 1
  max   = 2000
}


/* module "gcp_storage" {
  source       = "./modules/storage"
  project_id   = var.project_id
  name         = "${var.project_id}-${random_integer.random.result}"
} */


module "network" {
  source       = "./modules/network"
  project_id   = var.project_id
  network_name = "bastion-network-${random_integer.random.result}"
  subnet_name  = "bastion-subnet-${random_integer.random.result}"
  region       = var.region
}


module "firewall" {
  source                  = "./modules/firewall"
  network                 = module.network.network_name
  project_name            = var.project_id
  tag                     = var.tag
  depends_on              = [module.network]
}


resource "google_compute_instance" "bastion_host" {
  name         = "bastion-vm-${random_integer.random.result}"
  machine_type = var.machine_type

  boot_disk {
    initialize_params {
      image = var.image
    }
  }

  network_interface {
    subnetwork = module.network.subnetwork_name
    access_config {}
  }

  service_account {
    email  = google_service_account.bastion_host.email
    scopes = var.scopes
  }

  depends_on = [module.network]
}


resource "google_iap_tunnel_instance_iam_binding" "enable_iap" {
  project    = var.project_id
  zone       = var.zone
  instance   = google_compute_instance.bastion_host.name
  role       = var.role_iap_tunnel
  members    = var.members
  depends_on = [google_compute_instance.bastion_host]
}


resource "google_service_account_iam_binding" "bastion_sa_user" {
  service_account_id = google_service_account.bastion_host.id
  role               = var.role_sa
  members            = var.members
  depends_on         = [google_service_account.bastion_host]
}


resource "google_service_account" "bastion_host" {
  project      = var.project_id
  account_id   = "bastion-sa-${random_integer.random.result}"
  display_name = "Service Account for Bastion"
  depends_on   = [random_integer.random]
}