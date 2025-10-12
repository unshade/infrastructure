terraform {
  required_version = ">= 1.5"

  required_providers {
    infomaniak = {
      source  = "Infomaniak/infomaniak"
      version = "~> 1.0"
    }
  }
}


# ==========================================
# KaaStorama Cluster
# ==========================================

resource "infomaniak_kaas" "kaastorama" {
  public_cloud_id         = var.public_cloud_id
  public_cloud_project_id = var.public_cloud_project_id

  name               = var.cluster_name
  pack_name          = var.pack_name
  kubernetes_version = var.kubernetes_version
  region             = var.region
}

resource "infomaniak_kaas_instance_pool" "create_instance_pool_1" {
  public_cloud_id         = infomaniak_kaas.kaastorama.public_cloud_id
  public_cloud_project_id = infomaniak_kaas.kaastorama.public_cloud_project_id
  kaas_id                 = infomaniak_kaas.kaastorama.id

  name              = "${infomaniak_kaas.kaastorama.name}-pool-1"
  flavor_name       = "a2-ram4-disk20-perf1"
  min_instances     = 1
  max_instances     = 3
  availability_zone = "dc3-a-04"
}

module "flux-bootstrap" {
  source         = "./modules/flux"
  repository_url = var.repository_url
  gpg_private_key = var.gpg_private_key

  cluster_config = infomaniak_kaas.kaastorama.kubeconfig
}

