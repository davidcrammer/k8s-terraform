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

variable "ssh_public_key" {
  description = "SSH public key for the GitHub repository"
  type = string
}

variable "ssh_private_key" {
  description = "SSH deploy key for the GitHub repository"
  type = string
  sensitive = true
}