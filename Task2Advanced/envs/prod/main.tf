module "vm" {
  source = "../../modules/vm"

  providers = {
    yandex = yandex
  }

  name              = var.vm_name
  zone              = var.zone
  cores             = var.cores
  memory_gb         = var.memory_gb
  image_id          = data.yandex_compute_image.ubuntu.image_id
  data_disk_size_gb = var.data_disk_size_gb
  subnet_id         = local.subnet_id
  ssh_user          = var.ssh_user
  ssh_public_key    = file(pathexpand(var.ssh_public_key_path))
  enable_nat        = var.enable_nat
  labels            = var.labels
}
