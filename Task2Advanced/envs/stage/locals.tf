locals {
  subnet_id = coalesce(var.subnet_id, try(data.yandex_vpc_subnet.default[0].id, null))
}
