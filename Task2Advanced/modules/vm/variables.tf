variable "name" {
  description = "Имя виртуальной машины."
  type        = string
}

variable "zone" {
  description = "Зона доступности Yandex Cloud."
  type        = string
}

variable "cores" {
  description = "Количество vCPU."
  type        = number
}

variable "memory_gb" {
  description = "Объём RAM в гигабайтах."
  type        = number
}

variable "platform_id" {
  description = "Платформа (standard-v1, standard-v2, standard-v3)."
  type        = string
  default     = "standard-v3"
}

variable "image_id" {
  description = "ID образа ОС для загрузочного диска."
  type        = string
}

variable "boot_disk_size_gb" {
  description = "Размер загрузочного диска в гигабайтах."
  type        = number
  default     = 20
}

variable "boot_disk_type" {
  description = "Тип загрузочного диска."
  type        = string
  default     = "network-ssd"
}

variable "data_disk_size_gb" {
  description = "Размер подключаемого диска в гигабайтах."
  type        = number
}

variable "data_disk_type" {
  description = "Тип подключаемого диска."
  type        = string
  default     = "network-ssd"
}

variable "subnet_id" {
  description = "ID подсети для сетевого интерфейса ВМ."
  type        = string
}

variable "ssh_user" {
  description = "Имя пользователя ОС для SSH-доступа."
  type        = string
  default     = "ubuntu"
}

variable "ssh_public_key" {
  description = "Публичный SSH-ключ для доступа к ВМ."
  type        = string
}

variable "enable_nat" {
  description = "Назначить публичный IP через NAT."
  type        = bool
  default     = true
}

variable "labels" {
  description = "Метки ресурсов Yandex Cloud."
  type        = map(string)
  default     = {}
}
