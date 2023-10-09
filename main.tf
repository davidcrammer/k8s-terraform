terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
    }
  }
}

provider "digitalocean" {
  token = var.do_token
}

resource "digitalocean_droplet" "example" {
  image  = "ubuntu-20-04-x64"
  name   = "example-droplet"
  region = "sfo3"
  size   = "s-1vcpu-1gb"

  tags = [
    "web",
    "example",
  ]
}