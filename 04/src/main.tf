resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}
resource "yandex_vpc_subnet" "develop" {
  name           = var.vpc_name
  zone           = var.default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr
}

 module "marketing" {
  source = "./modules/c-instance"
  cloud_id = var.cloud_id
  folder_id = var.folder_id
  token = var.token
  instance_count = 1
  instance_name = "market"
  subnet_id = yandex_vpc_subnet.develop.id
  labels = { "depart" = "marketing" }
  vms_ssh_root_key = local.vms_ssh_root_key
  cloudinit = data.template_file.cloudinit.rendered
}

module "analytic" {
  source = "./modules/c-instance"
  cloud_id = var.cloud_id
  folder_id = var.folder_id
  token = var.token
  instance_count = 1
  instance_name = "analytic"
  subnet_id = yandex_vpc_subnet.develop.id
  labels = { "depart" = "analytic" }
  vms_ssh_root_key = local.vms_ssh_root_key
  cloudinit = data.template_file.cloudinit.rendered
} 

