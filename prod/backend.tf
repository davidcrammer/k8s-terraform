terraform {
  backend "s3" {
    endpoint        = "https://davidcrammer-k8s-demo.sfo3.digitaloceanspaces.com"
    region          = "us-west-1"
    bucket          = "davidcrammer-k8s-demo"
    key             = "terraform.tfstate"
    access_key      = ""
    secret_key      = ""
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    force_path_style = true
  }
}

