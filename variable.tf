variable "ip_cidr" {
  type = string
  description = "The IP CIDR for the node"
}

variable "gateway4" {
  type = string
  description = "The gateway for the node"
}

variable "tailscale_auth_key" {
  type = string
  description = "The tailscale auth key"
}
