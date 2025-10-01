terraform {
  required_version = ">= 1.5"

  required_providers {
    infomaniak = {
      source  = "Infomaniak/infomaniak"
      version = "~> 1.0"
    }
  }
}

provider "infomaniak" {
  token = var.infomaniak.token
}

resource "infomaniak_kaas" "kaastorama" {
  public_cloud_id         = 12484
  public_cloud_project_id = 35668

  name               = "kaastorama"
  pack_name          = "shared"
  kubernetes_version = 1.33
  region             = "dc3-a"
}

resource "infomaniak_kaas_instance_pool" "create_instance_pool_1" {
  public_cloud_id         = infomaniak_kaas.kaastorama.public_cloud_id
  public_cloud_project_id = infomaniak_kaas.kaastorama.public_cloud_project_id
  kaas_id                 = infomaniak_kaas.kaastorama.id

  name              = "${infomaniak_kaas.kaastorama.name}-pool-1"
  flavor_name       = "a2-ram4-disk20-perf1"
  min_instances     = 1
  availability_zone = "dc3-a-04"
}
