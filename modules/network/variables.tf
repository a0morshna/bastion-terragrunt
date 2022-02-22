variable "create_subnet"{
  type    = string
  default = "false"
}

variable "mtu" {
  type    = string
  default = "1460"
}

variable "ip_cidr_range" {
  type    = string
  default = "10.0.0.0/24"
}
    
variable "project_id" {}

variable "network_name" {}

variable "subnet_name" {}

variable "region" {}

