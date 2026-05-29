# Bounded Contexts — «Будущее 2.0»

```mermaid
flowchart TB
  subgraph Core["Core Domains"]
    Clinical["Clinical Care\n(клиники, визиты, EHR)"]
    Fintech["Retail Banking\n(счета, кредиты)"]
    AI["Clinical AI\n(инференс, модели)"]
  end

  subgraph Supporting["Supporting"]
    Staff["Hospital Operations\n(персонал, смены)"]
    Inventory["Medical Inventory\n(склад, расходники)"]
  end

  subgraph Generic["Generic"]
    Analytics["Analytics & Data Products\n(без PHI)"]
    Identity["Identity & Access\n(SSO, RBAC)"]
  end

  Clinical -->|"PatientRegistered,\nVisitCompleted"| Analytics
  Fintech -->|"CreditIssued,\nPaymentReceived"| Analytics
  AI -->|"DiagnosisSuggested"| Clinical
  Clinical <-->|"PatientId"| Fintech
  Staff --> Clinical
  Inventory --> Clinical
  Identity --> Clinical
  Identity --> Fintech
  Identity --> Analytics
```

## Контексты

| Bounded Context | Ответственность | Не включает |
|-----------------|-----------------|-------------|
| **Clinical Care** | Медкарты, визиты, назначения, снимки | Кредитный скоринг |
| **Retail Banking** | Счета, платежи, кредиты | Диагнозы, PHI |
| **Clinical AI** | ML-инференс, рекомендации | Хранение первичных карт (только читает) |
| **Hospital Operations** | Расписания, персонал | Финансовый ledger |
| **Medical Inventory** | Остатки, заказы расходников | BI-отчёты |
| **Analytics & Data Products** | Витрины, агрегаты, портал | PHI, истории болезней |
| **Identity & Access** | SSO, роли, consent | Бизнес-логику доменов |

## Context Map (отношения)

| Upstream | Downstream | Тип связи |
|----------|------------|-----------|
| Clinical Care | Analytics | Published Language (события без PHI) |
| Retail Banking | Analytics | Published Language |
| Clinical AI | Clinical Care | Customer-Supplier |
| Clinical Care | Retail Banking | Partnership (PatientId) |
| Legacy DWH | Analytics | ACL / Conformist (временно) |
