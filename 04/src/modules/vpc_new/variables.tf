variable "env_name" {
  type        = string
  default     = "develop"
  description = "VPC network&subnet name"
}
variable "subnets" {
  type = list(map(string))
  default = [ { "zone" = "ru-central1-a", "cidr" = "172.16.1.0/24" } ]
}