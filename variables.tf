variable "do_token" {
  description = "DigitalOcean API token"
  type        = string
  sensitive   = true
}

variable "github_token" {
  sensitive = true
  type      = string
}

variable "github_org" {
  type = string
  default = "davidcrammer"
}

variable "github_repository" {
  type = string
  default = "example-fluxcd"
}