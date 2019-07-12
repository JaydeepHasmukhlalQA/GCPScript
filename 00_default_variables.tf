variable "project" {
  default = "gcp-week-246209"
}

variable "name" {
  type = "map"
  default = {
    "poolui"  = "poolui"
    "poolapi" = "poolapi"
  }
}

variable "machine_type" {
  type = "map"
  default = {
    "standard1" = "n1-standard-1"
    "standard2" = "n1-standard-2"
    "standard4" = "n1-standard-4"
    "standard8" = "n1-standard-8"
  }
}

variable "zone" {
  default = "europe-west2-c"
}

variable "image" {
  type = "map"
  default = {
    "centos7"                 = "centos-7-v20190619"
    "ubuntu_1804_lts"         = "ubuntu-1804-bionic-v20190628"
    "ubuntu_1804_lts_minimal" = "ubuntu-minimal-1804-bionic-v20190628"
  }
}

variable "network" {
  default = "default"
}

variable "ssh_user" {
  type = "map"
  default = {
    "poolui"  = "poolui"
    "poolapi" = "poolapi"
  }
}

variable "public_key" {
  default = "~/.ssh/id_rsa.pub"
}

variable "private_key" {
  default = "~/.ssh/id_rsa"
}

variable "package_manager" {
  default = "apt"
}

variable "install_packages" {
  default = {
    "yum" = "sudo yum install -y"
    "apt" = "sudo apt install -y"
  }
}

variable "update_packages" {
  default = {
    "yum" = "sudo yum update -y"
    "apt" = "sudo apt update && sudo apt upgrade -y"
  }
}

variable "packages" {
  default = [
    "git",
    "wget"
  ]
}

variable "scripts" {
  default = ["scripts/poolui.sh"]
}

variable "poolui_allowed_ports" {
  default = ["22", "4200"]
}

variable "poolapi_allowed_ports" {
  default = ["22", "8080"]
}

locals {
  timestamp           = "${formatdate("YYYYMMDDhhmm", timestamp())}"
  timestamp_sanitized = "${replace("${local.timestamp}", "/[-| |T|Z|:]/", "")}"
}
