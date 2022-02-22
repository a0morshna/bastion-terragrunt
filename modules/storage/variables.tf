variable "storage_location" {
  type    = string
  default = "EU"
}

variable "storage_class" {
  type    = string
  default = "MULTI_REGIONAL"
}

variable "lifecycle_action" {
  type    = string
  default = "Delete"
}

variable "name" {}

variable "project_id" {}