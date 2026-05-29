zone              = "ru-central1-a"
vm_name           = "future20-stage-vm"
cores             = 4
memory_gb         = 8
data_disk_size_gb = 100
enable_nat        = true

labels = {
  project     = "budushee-2-0"
  environment = "stage"
}
