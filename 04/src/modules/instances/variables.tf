###cloud vars
variable "token" {
  type        = string
  sensitive = true
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}


variable "cloud_id" {
  type        = string
  sensitive = true
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  sensitive = true
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

### instances var

variable "instance_count" {
  type = number
  default = 1
  description = "скока делать мажинок )"
}

variable "instance_name" {
  type = string
  default = "vm"
  description = "как бум обзывать мажинки? O_o"
}

variable "image_id" {
  type = string
  default = "ubuntu-2204-lts"
}

variable vm_param {
  type = map(any)
  default = ({
      cores = 2,
      memory = 1,
      c_fract = 20
    })
    description = "параметры вм"
}

variable "vm_preemptible" {
  type = bool
  default = true
  description = "прерываемая вм"
}

variable "vms_ssh_port_enable" {
  type = number
  default = 1
}

variable "vms_ssh_root_key" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "platform" {
  type = string
  default = "standard-v3"
}

variable "labels" {
  type = map(string)
  default = {
    "department" = "it"
  }
}

variable "cloudinit" {
  type = string
}