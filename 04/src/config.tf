data template_file "cloudinit" {
  template = file("./cloud-init.yml")

  vars = {
    ssh_public_key = local.vms_ssh_root_key
  }
}