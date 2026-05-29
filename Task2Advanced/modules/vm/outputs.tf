output "vm_id" {
  description = "ID виртуальной машины."
  value       = yandex_compute_instance.this.id
}

output "vm_name" {
  description = "Имя виртуальной машины."
  value       = yandex_compute_instance.this.name
}

output "private_ip" {
  description = "Внутренний IP-адрес ВМ."
  value       = yandex_compute_instance.this.network_interface[0].ip_address
}

output "public_ip" {
  description = "Публичный IP-адрес ВМ."
  value       = try(yandex_compute_instance.this.network_interface[0].nat_ip_address, null)
}

output "data_disk_id" {
  description = "ID подключаемого диска."
  value       = yandex_compute_disk.data.id
}
