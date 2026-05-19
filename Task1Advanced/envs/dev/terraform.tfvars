zone              = "ru-central1-a"
vm_name           = "future20-dev-vm"
cores             = 2
memory_gb         = 4
data_disk_size_gb = 50
enable_nat        = true

labels = {
  project     = "budushee-2-0"
  environment = "dev"
}
