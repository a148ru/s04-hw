/* resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}
resource "yandex_vpc_subnet" "develop" {
  name           = var.vpc_name
  zone           = var.default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr
} */

module "vpc"{
  source = "./modules/vpc"
  token = var.token
  cloud_id = var.cloud_id
  folder_id = var.folder_id
  default_zone = var.default_zone
  default_cidr = var.default_cidr
}

 module "marketing" {
  source = "./modules/instances"
  cloud_id = var.cloud_id
  folder_id = var.folder_id
  token = var.token
  instance_count = 1
  instance_name = var.names.0
  subnet_id = module.vpc.vpc_subnet_id
  labels = { "department" = "${var.names.0}" }
  vms_ssh_root_key = local.vms_ssh_root_key
  cloudinit = data.template_file.cloudinit.rendered
}

module "analytic" {
  source = "./modules/instances"
  cloud_id = var.cloud_id
  folder_id = var.folder_id
  token = var.token
  instance_count = 1
  instance_name = var.names.1
  subnet_id = module.vpc.vpc_subnet_id
  labels = { "department" = "${var.names.1}" }
  vms_ssh_root_key = local.vms_ssh_root_key
  cloudinit = data.template_file.cloudinit.rendered
} 

module "vpc_new" {
  source = "./modules/vpc_new"
  env_name = "production"
  token = var.token
  cloud_id = var.cloud_id
  folder_id = var.folder_id
  subnets = [
    { zone = "ru-central1-a", cidr = "172.16.1.0/24" },
    { zone = "ru-central1-b", cidr = "172.16.2.0/24" },
    { zone = "ru-central1-d", cidr = "172.16.3.0/24" },
  ]
}