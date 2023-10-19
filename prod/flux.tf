provider "github" {
  owner = var.github_org
  token = var.github_token
}

resource "github_repository_deploy_key" "this" {
  title      = "Flux CD New Deploy Key"
  repository = var.github_repository
  key        = var.ssh_public_key
  read_only  = "false"
}
 
provider "flux" {
  kubernetes = {
    host                   = digitalocean_kubernetes_cluster.cluster.endpoint
    client_certificate     = base64decode(digitalocean_kubernetes_cluster.cluster.kube_config.0.client_certificate)
    client_key             = base64decode(digitalocean_kubernetes_cluster.cluster.kube_config.0.client_key)
    cluster_ca_certificate = base64decode(digitalocean_kubernetes_cluster.cluster.kube_config.0.cluster_ca_certificate)
  }
  git = {
    url = "ssh://git@github.com/${var.github_org}/${var.github_repository}.git"
    ssh = {
      username    = "git"
      private_key = var.ssh_private_key
    }
  }
}

resource "flux_bootstrap_git" "this" {
  depends_on = [github_repository_deploy_key.this]
  path = "manifests"
}