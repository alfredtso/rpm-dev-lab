terraform {
  required_providers {
    lxd = {
      source = "terraform-lxd/lxd"
      version = "2.0.0"
    }
  }
}

provider "lxd" {
}

resource "lxd_instance" "fedora-rpm" {
  name  = "fedora-rpm"
  image = "images:fedora/40/cloud"
  profiles = ["mybr"]

  config = {
    "cloud-init.user-data" = templatefile("./my-user-data.tfpl", 
    {
        tailscale_auth_key = var.tailscale_auth_key
    }),
    "cloud-init.network-config" = templatefile("./netplan.tfpl", 
    {
      ipv4_addr = var.ip_cidr,
      gateway4 = var.gateway4
    })
  }
}

