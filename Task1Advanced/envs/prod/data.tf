data "yandex_compute_image" "ubuntu" {
  family = "ubuntu-2204-lts"
}

data "yandex_vpc_subnet" "default" {
  count = var.subnet_id == null ? 1 : 0
  name  = "default-${var.zone}"
}
