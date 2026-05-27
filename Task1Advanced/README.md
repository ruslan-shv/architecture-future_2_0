# Задание 1: модульная инфраструктура Terraform

Проект использует:

- переиспользуемый модуль `modules/vm`;
- окружения `dev`, `stage`, `prod` в `envs/*`;
- конфигурацию окружения в `terraform.tfvars`.

## Инструкция

Запуск из каталога окружения.

### Dev

```bash
cd Task1Advanced/envs/dev
terraform init -backend=false
terraform plan -var-file=terraform.tfvars
terraform apply -var-file=terraform.tfvars
```

### Stage

```bash
cd Task1Advanced/envs/stage
terraform init -backend=false
terraform plan -var-file=terraform.tfvars
terraform apply -var-file=terraform.tfvars
```

### Prod

```bash
cd Task1Advanced/envs/prod
terraform init -backend=false
terraform plan -var-file=terraform.tfvars
terraform apply -var-file=terraform.tfvars
```

## Параметры

### Обязательные (в tfvars)

| Переменная          | Описание                    |
|---------------------|-----------------------------|
| `zone`              | Зона Yandex Cloud           |
| `vm_name`           | Имя VM                      |
| `cores`             | Количество vCPU             |
| `memory_gb`         | Объем RAM в GB              |
| `data_disk_size_gb` | Размер подключаемого диска  |
| `enable_nat`        | Публичный IP через NAT      |
