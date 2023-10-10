provider "flux" {
  # default config for all flux resources
}

resource "flux_install" "example" {
  target_path = "github.com/davidcrammer/example-fluxcd/manifests"
  namespace   = "flux-system"
}

resource "flux_sync" "example" {
  url       = "https://github.com/davidcrammer/example-fluxcd"
  branch    = "main"
  namespace = "flux-system"
}
