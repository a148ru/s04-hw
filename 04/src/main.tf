module "vpc"{
  source = "./modules/vpc"
  default_zone = var.default_zone
  default_cidr = var.default_cidr
}

 module "marketing" {
  source = "./modules/instances"
  folder_id = var.folder_id
  instance_count = 1
  instance_name = var.names.0
  subnet_id = module.vpc.vpc_subnet_id
  labels = { "department" = "${var.names.0}" }
  vms_ssh_root_key = local.vms_ssh_root_key
  cloudinit = data.template_file.cloudinit.rendered
}

module "analytic" {
  source = "./modules/instances"
  folder_id = var.folder_id
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
  subnets = [
    { zone = "ru-central1-a", cidr = "172.16.1.0/24" },
    { zone = "ru-central1-b", cidr = "172.16.2.0/24" },
    { zone = "ru-central1-d", cidr = "172.16.3.0/24" },
  ]
}