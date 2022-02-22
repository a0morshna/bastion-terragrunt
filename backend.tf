terraform {
  backend "gcs" {
    bucket  = "cicd-backend-peex-2221"
    prefix  = "terraform/state"
  }
}