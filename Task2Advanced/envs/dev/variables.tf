variable "zone" {
  description = "Зона размещения ресурсов."
  type        = string
}

variable "vm_name" {
  description = "Имя ВМ."
  type        = string
}

variable "cores" {
  description = "Количество vCPU."
  type        = number
}

variable "memory_gb" {
  description = "Объём RAM (ГБ)."
  type        = number
}

variable "data_disk_size_gb" {
  description = "Размер подключаемого диска (ГБ)."
  type        = number
}

variable "subnet_id" {
  description = "ID подсети. Если не указан — ищется подсеть default-<zone> (см. yc vpc subnet list)."
  type        = string
  default     = null
  nullable    = true
}

variable "ssh_public_key_path" {
  description = "Путь к файлу публичного SSH-ключа (как в практике курса: file(...))."
  type        = string
  default     = "~/.ssh/id_ed25519.pub"
}

variable "ssh_user" {
  description = "Пользователь SSH."
  type        = string
  default     = "ubuntu"
}

variable "enable_nat" {
  description = "Публичный IP через NAT."
  type        = bool
  default     = true
}

variable "labels" {
  description = "Метки окружения."
  type        = map(string)
  default     = {}
}
