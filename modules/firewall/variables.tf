variable "firewall_name_iap" {
  type    = string
  default = "allow-iap-bastion"
}

variable "protocol_name_iap" {
  type    = string
  default = "tcp"
}

variable "protocol_iap_ports" {
  type    = list
  default = ["8080","22"]
}

variable "iap_source_ranges" {
  type    = list
  default = ["35.235.240.0/20"]
}

variable "iap_direction" {
  type    = string
  default = "INGRESS"
}

variable "allow_access_protocol_name" {
  type    = string
  default = "icmp" 
}

variable "tcp_ports" {
  type    = list
  default = ["22", "80", "443", "3389"]
}

variable "firewall_egress_direction" {
  type    = string
  default = "EGRESS"
}

variable "firewall_egress_protocol" {
  type    = string
  default = "all"
}

variable "priority" {
  type    = string
  default = "1000"
}

variable "destination_ranges" {
  type    = list(string)
  default = ["0.0.0.0/0"]
}

variable "firewall_egress_name" {
  type    = string
  default = "firewall-egress"
}

variable "firewall_access_bastion" {
  type    = string
  default = "access-bastion"
}

variable "network" {}

variable "project_name" {}

variable "tag" {}
