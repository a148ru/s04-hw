variable "cluster_name" {
  description = "Name of the MySQL cluster"
  type        = string
}

variable "mysql_version" {
  description = "Version of MySQL"
  type        = string
  default = "8.0"
}

variable "network_id" {
  description = "Network ID for the cluster"
  type        = string
}

variable "primary_zone" {
  description = "Zone for the primary host"
  type        = string
}

variable "replicas" {
  description = "List of replicas with their zones"
  type        = map(object({
    zone = string
  }))
}

variable "resource_preset_id" {
  description = "Resource preset ID for the hosts"
  type        = string
  default = "s2.micro"
}

variable "disk_size" {
  description = "Disk size in GB"
  type        = number
  default = 10
}

variable "disk_type_id" {
  description = "Disk type ID"
  type        = string
  default = "network-hdd"
}

variable "environment" {
  type = string
  default = "PRODUCTION"
  description = "окружение: PRESTABLE или PRODUCTION"
}