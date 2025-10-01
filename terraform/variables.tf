variable "infomaniak" {
  description = "Infomaniak API token and related info"
  type = object({
    token      = string
  })
}
variable "public_cloud_id" {
  description = "The ID of the public cloud"
  type        = number
  default     = 12484
}

variable "public_cloud_project_id" {
  description = "The ID of the public cloud project"
  type        = number
  default     = 35668
}

variable "cluster_name" {
  description = "The name of the KaaS cluster"
  type        = string
  default     = "kaastorama"
}

variable "kubernetes_version" {
  description = "The Kubernetes version for the cluster"
  type        = number
  default     = 1.33
}

variable "pack_name" {
  description = "The pack name for the cluster"
  type        = string
  default     = "shared"
}

variable "region" {
  description = "The region for the cluster"
  type        = string
  default     = "dc3-a"
}
