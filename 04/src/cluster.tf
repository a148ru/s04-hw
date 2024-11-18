module "mysql_cluster" {
  depends_on = [ module.vpc_new ]
  source           = "./modules/cluster-mysql"
  cluster_name     = "mysql-cluster"
  network_id       = module.vpc_new.vpc_network.id
  primary_zone     = var.default_zone
  
  replicas = {
    replica1 = { zone = "ru-central1-b" }
    replica2 = { zone = "ru-central1-d" }
  }

}