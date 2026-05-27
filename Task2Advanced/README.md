# Задание 2: CI/CD и удаленное состояние Terraform

Проект использует:

- модуль `modules/vm` и окружения `envs/dev`, `envs/stage`, `envs/prod`;
- backend S3 (Yandex Object Storage) в `envs/*/backend.tf`;
- pipeline GitHub Actions: `.github/workflows/terraform-task2.yml`.

## Что настроено

- remote state в бакете `future20-terraform-state`;
- отдельные ключи state: `dev/`, `stage/`, `prod/`;
- plan на Pull Request;
- apply вручную через `workflow_dispatch` с approval (GitHub Environments).

## Инструкция

Шаг 1. Создайте бакет и ключи доступа к Object Storage:

```bash
chmod +x scripts/bootstrap-backend.sh
./scripts/bootstrap-backend.sh future20-terraform-state
```

Шаг 2. Добавьте secrets в GitHub (Settings → Secrets → Actions):

| Secret                  | Описание              |
|-------------------------|-----------------------|
| `YC_STORAGE_ACCESS_KEY` | Access Key бакета     |
| `YC_STORAGE_SECRET_KEY` | Secret Key бакета     |
| `YC_TOKEN`              | Токен Yandex Cloud    |
| `YC_CLOUD_ID`           | ID облака             |
| `YC_FOLDER_ID`          | ID каталога           |

Шаг 3. Создайте Environments `dev`, `stage`, `prod` (для `prod` — Required reviewers).

Шаг 4. Локальный запуск с backend:

```bash
export AWS_ACCESS_KEY_ID="<ключ>"
export AWS_SECRET_ACCESS_KEY="<секрет>"
export YC_TOKEN="<токен>"

cd Task2Advanced/envs/dev
terraform init
terraform plan -var-file=terraform.tfvars
terraform apply -var-file=terraform.tfvars
```

Для stage и prod — те же команды из `envs/stage` и `envs/prod`.

Шаг 5. CI: откройте Pull Request — выполнится plan; apply — Actions → Run workflow → `apply`.

## Backend

| Окружение | Ключ state                 |
|-----------|----------------------------|
| dev       | `dev/terraform.tfstate`    |
| stage     | `stage/terraform.tfstate`  |
| prod      | `prod/terraform.tfstate`   |

Локальный `terraform.tfstate` после `terraform init` с backend не используется.

## Параметры и outputs

См. [Task1Advanced/README.md](../Task1Advanced/README.md).
