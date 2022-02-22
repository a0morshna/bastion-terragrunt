variable "project_name" {
  default = ""
}

variable "project_id" {
  default = ""
}

variable "region" {
  default = ""
}

variable "zone" {
  default = ""
}

variable "image" {
  default = ""
}

variable "machine_type" {
  default = ""
}

# firewall variables

variable "tag" {
  default = ""
}

variable "firewall_egress_name" {
  default = ""
}

variable "firewall_access_bastion" {
  default = ""
}

# account

variable "service-account" {
  default = ""
}

variable "members" {
  type    = list(string)
  default = ["user:moaleksandra780@gmail.com"]
}

variable "role_sa" {
  default = ""
}

variable "role_iap_tunnel" {
  default = ""
}

variable "scopes" {
  type        = list(string)

  description = "List of scopes to attach to the bastion host"
  default     = ["cloud-platform"]
}

variable "service_account_roles" {
  type        = list(string)

  description = "List of IAM roles to assign to the service account."
  default = [
    "roles/logging.logWriter",       # Logs Writer
    "roles/monitoring.metricWriter", # Monitoring Metric Writer
    "roles/monitoring.viewer",       # Monitoring Viewer
    "roles/compute.osLogin",         # Compute OS Login
  ]
}