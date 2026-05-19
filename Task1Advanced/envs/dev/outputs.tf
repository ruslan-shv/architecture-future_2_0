output "vm_id" {
  value       = module.vm.vm_id
  description = "ID виртуальной машины."
}

output "vm_name" {
  value       = module.vm.vm_name
  description = "Имя виртуальной машины."
}

output "private_ip" {
  value       = module.vm.private_ip
  description = "Внутренний IP."
}

output "public_ip" {
  value       = module.vm.public_ip
  description = "Публичный IP."
}

output "data_disk_id" {
  value       = module.vm.data_disk_id
  description = "ID подключаемого диска."
}
