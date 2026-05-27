zone              = "ru-central1-a"
vm_name           = "future20-prod-vm"
cores             = 8
memory_gb         = 16
data_disk_size_gb = 500
enable_nat        = false

labels = {
  project     = "budushee-2-0"
  environment = "prod"
}
