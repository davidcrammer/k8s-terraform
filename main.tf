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

resource "digitalocean_kubernetes_cluster" "cluster" {
  version = "1.22.8-do.1"
  name   = "example-cluster"
  region = "nyc1"

  node_pool {
    name       = "worker-pool"
    size       = "s-1vcpu-2gb"
    node_count = 1
  }
}