# module instances

terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = "~>1.8.4"
}


data "yandex_compute_image" "os_image" {
    family = var.image_id
}

resource "yandex_compute_instance" "vm_instance" {
    count = var.instance_count
    name = "${var.instance_name}-${count.index}"
    folder_id = var.folder_id
    platform_id = var.platform

    labels = var.labels

    resources {
        cores         = var.vm_param.cores
        memory        = var.vm_param.memory
        core_fraction = var.vm_param.c_fract
    }

    boot_disk {
        initialize_params {
            image_id = data.yandex_compute_image.os_image.image_id
        }
    }

    scheduling_policy {
        preemptible = var.vm_preemptible
    }

    network_interface {
        subnet_id = var.subnet_id
        nat       = true
    }

    metadata = {
        user-data = var.cloudinit 
        serial-port-enable = 1
    }
}




