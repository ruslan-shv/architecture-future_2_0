resource "yandex_compute_disk" "boot" {
  name     = "${var.name}-boot"
  type     = var.boot_disk_type
  zone     = var.zone
  size     = var.boot_disk_size_gb
  image_id = var.image_id
  labels   = var.labels
}

resource "yandex_compute_disk" "data" {
  name   = "${var.name}-data"
  type   = var.data_disk_type
  zone   = var.zone
  size   = var.data_disk_size_gb
  labels = var.labels
}

resource "yandex_compute_instance" "this" {
  name        = var.name
  platform_id = var.platform_id
  zone        = var.zone
  labels      = var.labels

  resources {
    cores  = var.cores
    memory = var.memory_gb
  }

  boot_disk {
    disk_id = yandex_compute_disk.boot.id
  }

  secondary_disk {
    disk_id = yandex_compute_disk.data.id
  }

  network_interface {
    subnet_id = var.subnet_id
    nat       = var.enable_nat
  }

  metadata = {
    ssh-keys = "${var.ssh_user}:${var.ssh_public_key}"
  }
}
