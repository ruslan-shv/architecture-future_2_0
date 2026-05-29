#!/usr/bin/env bash
set -euo pipefail

BUCKET_NAME="${1:-future20-terraform-state}"

yc storage bucket create --name "${BUCKET_NAME}" 2>/dev/null || true
yc storage bucket update --name "${BUCKET_NAME}" --versioning versioning-enabled
yc storage bucket update --name "${BUCKET_NAME}" --default-storage-class standard

echo "Bucket ${BUCKET_NAME} готов. Укажите статические ключи доступа в secrets CI."
