resource "google_storage_bucket" "bucket" {
  name          = var.name
  project       = var.project_id
  location      = var.storage_location
  force_destroy = true
  storage_class = var.storage_class
  versioning {
    enabled = true
  }

  lifecycle_rule {
    action {
      type = var.lifecycle_action
    }

    condition {
      num_newer_versions = 1
    }
  }

}