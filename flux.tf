provider "flux" {
  kubernetes = {
    config_path = "~/.kube/config"
  }
  git = {
    url = "https://github.com/davidcrammer/example-fluxcd.git"
  }
}