terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
    }
    flux = {
      source = "fluxcd/flux"
    }
    github = {
      source  = "integrations/github"
      version = ">=5.18.0"
    }
  }
}

provider "digitalocean" {
  token = var.do_token
}

resource "digitalocean_kubernetes_cluster" "cluster" {
  version = "1.28.2-do.0"
  name   = "example-cluster"
  region = "sfo3"

  node_pool {
    name       = "worker-pool"
    size       = "s-2vcpu-4gb"
    node_count = 2
  }
}