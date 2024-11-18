terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = "~>1.8.4"
}

resource "yandex_mdb_mysql_cluster" "mysql_cluster" {
    name = var.cluster_name
    environment = var.environment
    version = var.mysql_version
    network_id = var.network_id

    resources {
            resource_preset_id = var.resource_preset_id
            disk_size          = var.disk_size
            disk_type_id       = var.disk_type_id
    }

    host {
        name     = "${var.cluster_name}-primary"
        zone     = var.primary_zone
    }

    dynamic "host" {
        for_each = var.replicas
        content {
            name     = "${var.cluster_name}-replica-${host.key}"
            zone     = host.value.zone
        }
    }
}