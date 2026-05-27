# Каталог доменных событий

| Событие | Источник | Семантика | Минимальный контракт (JSON) |
|---------|----------|-----------|----------------------------|
| `PatientRegistered` | Clinical Care | Зарегистрирован новый пациент | `{ "eventId", "patientId", "registeredAt", "clinicId" }` |
| `VisitCompleted` | Clinical Care | Завершён визит | `{ "eventId", "visitId", "patientId", "completedAt", "departmentId" }` |
| `DiagnosisSuggested` | Clinical AI | ИИ предложил диагноз | `{ "eventId", "jobId", "visitId", "confidence", "suggestedAt" }` |
| `CreditApplicationSubmitted` | Retail Banking | Подана заявка на кредит | `{ "eventId", "creditId", "patientId", "amount", "submittedAt" }` |
| `CreditIssued` | Retail Banking | Создан кредитный договор | `{ "eventId", "creditId", "patientId", "amount", "issuedAt" }` |
| `PaymentReceived` | Retail Banking | Получен платёж | `{ "eventId", "paymentId", "accountId", "amount", "receivedAt" }` |
| `StockDepleted` | Medical Inventory | Порог остатка достигнут | `{ "eventId", "skuId", "warehouseId", "quantity", "at" }` |

## Подписчики

| Событие | Подписчики |
|---------|------------|
| `PatientRegistered` | Retail Banking (создать клиента), Analytics |
| `VisitCompleted` | Analytics |
| `DiagnosisSuggested` | Clinical Care (UI врача) |
| `CreditIssued` | Analytics |
| `PaymentReceived` | Analytics, Accounting (будущий) |
| `StockDepleted` | Hospital Operations, закупки |

## Версионирование

- Схема в Schema Registry (Avro/Protobuf).
- Поле `schemaVersion` в envelope.
- Обратная совместимость: только добавление optional-полей.
