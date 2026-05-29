# Event Storming — сквозной сценарий «Пациент + кредит на лечение»

```mermaid
sequenceDiagram
  participant Op as Оператор клиники
  participant CC as Clinical Care
  participant AI as Clinical AI
  participant FT as Retail Banking
  participant AN as Analytics

  Op->>CC: Регистрация пациента
  CC-->>AN: PatientRegistered
  CC-->>FT: PatientRegistered

  Op->>CC: Визит, назначение обследования
  CC->>AI: Запрос анализа снимка
  AI-->>CC: DiagnosisSuggested
  CC-->>AN: VisitCompleted (агрегат без PHI)

  Op->>FT: Заявка на кредит на лечение
  FT-->>AN: CreditApplicationSubmitted
  FT-->>AN: CreditIssued

  Note over AN: Витрина: воронка кредитов,<br/>нагрузка клиник — без мед. карт
```

## Потоки по доменам

```mermaid
flowchart LR
  CC[Clinical Care]
  AI[Clinical AI]
  FT[Retail Banking]
  INV[Inventory]
  AN[Analytics]

  CC -->|PatientRegistered| AN
  CC -->|PatientRegistered| FT
  CC -->|VisitCompleted| AN
  AI -->|DiagnosisSuggested| CC
  FT -->|CreditIssued| AN
  FT -->|PaymentReceived| AN
  INV -->|StockDepleted| AN
```

## Легенда

- **Команда** — действие пользователя (регистрация, заявка на кредит).
- **Событие** — факт в прошедшем времени (опубликован в шину).
- **Политика** — реакция подписчика (FT создаёт профиль клиента на `PatientRegistered`).
