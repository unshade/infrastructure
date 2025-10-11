variable "cluster_config" {
  description = "The raw Kubernetes cluster configuration"
  type        = string
}

variable "repository_url" {
  description = "URL of the Git repository"
  type = string
  default = "git@github.com:unshade/infrastructure.git"
}

variable "gpg_private_key" {
  description = "Path to the GPG private key"
  type = string
  default = "files/keys/gpg.asc"
}
