# Расширенный технический радар — «Будущее 2.0»

| Технология / паттерн | Квадрант | Статус | Комментарий |
|----------------------|----------|--------|-------------|
| **Data Mesh** | Паттерны данных | **Adopt** | Федеративные data products по доменам |
| **Event-Driven Architecture** | Интеграция | **Adopt** | Целевая модель через Kafka/Pulsar |
| **Self-service BI / Portal** | Аналитика | **Adopt** | Замена тяжёлого Power BI для типовых срезов |
| **Lakehouse (Iceberg/Delta)** | Хранение | **Trial** | Пилот на фин. и операционных данных |
| **Kubernetes (managed)** | Платформа | **Adopt** | Облако, автоскейлинг |
| **Terraform + remote state** | IaC | **Adopt** | Задания 1–2, мульти-env |
| **Apache Kafka** | Messaging | **Adopt** | Event bus |
| **Schema Registry (Confluent/Apicurio)** | Messaging | **Trial** | Этап 1 пилота |
| **SQL Server 2008 DWH** | Хранение | **Hold** | Вывод, только ACL |
| **Apache Camel ESB** | Интеграция | **Hold** | Мост совместимости |
| **PowerBuilder UI** | Клиент | **Hold** | Замена на web EHR |
| **Power BI** | BI | **Assess** | Постепенная замена порталом |
| **CDC (Debezium)** | Данные | **Trial** | Синхронизация с легаси |
| **Zero Trust / mTLS** | Безопасность | **Adopt** | Межсервисная аутентификация |
| **Feature Store** | ML | **Assess** | Для ИИ-домена |
| **API Gateway (Kong/YC ALB)** | Платформа | **Adopt** | Единая точка входа |
| **Observability (Prometheus/Grafana)** | Ops | **Adopt** | SLO критичных сервисов |
| **CQRS** | Паттерн | **Trial** | Read models для витрин |
| **Saga / Outbox** | Паттерн | **Adopt** | Распределённые транзакции финтеха |

### Легенда статусов

- **Adopt** — использовать в новых проектах.
- **Trial** — пилот в 1–2 доменах.
- **Assess** — изучить, не внедрять массово.
- **Hold** — не расширять, планировать вывод.
