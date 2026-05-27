# C4: уровень контейнеров — «Будущее 2.0» (целевое состояние, 3 года)

## Контекст (Level 1)

```mermaid
C4Context
  title Системный контекст «Будущее 2.0»

  Person(operator, "Оператор клиники", "Работа с пациентами")
  Person(analyst, "Бизнес-аналитик", "Отчёты и витрины")
  Person(client, "Клиент", "Медицина + финтех")

  System_Boundary(future20, "Экосистема Будущее 2.0") {
    System(portal, "Портал самообслуживания", "Витрина данных без PHI")
    System(medical, "Медицинский домен", "Клиники, карты, исследования")
    System(fintech, "Финтех-домен", "Счета, кредиты, платежи")
    System(ai, "ИИ-домен", "Диагностика, ML")
    System(integration, "Интеграционный слой", "События, ACL")
  }

  System_Ext(regulator, "Регуляторы", "152-ФЗ, банковский надзор")
  System_Ext(pharma, "Фарма-партнёры", "Будущие интеграции")
  System_Ext(equipment, "Производитель оборудования", "IoT/данные устройств")

  Rel(operator, medical, "Вводит мед. данные")
  Rel(analyst, portal, "Строит отчёты")
  Rel(client, fintech, "Финансовые сервисы")
  Rel(client, medical, "Медицинские сервисы")
  Rel(medical, integration, "События")
  Rel(fintech, integration, "События")
  Rel(ai, integration, "События")
  Rel(integration, portal, "Аналитические витрины")
  Rel(portal, analyst, "Данные без PHI")
  Rel(future20, regulator, "Аудит, отчётность")
  Rel(integration, pharma, "События заказов")
  Rel(integration, equipment, "Телеметрия")
```

## Контейнеры (Level 2)

```mermaid
flowchart TB
  subgraph Clinical["Медицинский домен"]
    EHR["EHR / МИС\n(замена PowerBuilder UI)"]
    MedDB[("Операционная БД\nмед. данных")]
    EHR --> MedDB
  end

  subgraph Fintech["Финтех-домен"]
    BankAPI["Banking API\n(Go/Java)"]
    Ledger[("Ledger DB")]
    BankAPI --> Ledger
  end

  subgraph AI["ИИ-домен"]
    ML["ML Inference\n(Python)"]
    FeatureStore[("Feature Store")]
    ML --> FeatureStore
  end

  subgraph Data["Домен данных и аналитики"]
    Portal["Self-Service Portal\n(витрина без PHI)"]
    Mesh["Data Products\n(Data Mesh)"]
    Lake[("Lakehouse / Object Storage")]
    Portal --> Mesh
    Mesh --> Lake
  end

  subgraph Platform["Платформа интеграции"]
    Bus["Event Bus\n(Kafka / Pulsar)"]
    Schema["Schema Registry"]
    ACL["Anti-Corruption Layer\n(legacy Camel/DWH)"]
    Bus --> Schema
  end

  subgraph Legacy["Мосты совместимости (миграция)"]
    DWH[("SQL Server DWH\n(сокращается)")]
    Camel["Apache Camel ESB"]
    BI["Power BI → замена"]
    Camel --> DWH
    BI --> DWH
  end

  EHR -->|"PatientRegistered,\nVisitCompleted"| Bus
  BankAPI -->|"CreditIssued,\nPaymentReceived"| Bus
  ML -->|"DiagnosisSuggested"| Bus
  Bus --> Mesh
  ACL --> Bus
  Camel -.-> ACL
  DWH -.-> ACL
  Mesh -.->|"batch / CDC"| ACL
```

## Ключевые изменения vs AS-IS

| AS-IS | TO-BE (3 года) |
|-------|----------------|
| DWH — центр всей логики | Доменные OLTP + Data Products; DWH только как мост |
| Camel — основная шина | Event Bus; Camel — ACL для легаси |
| Power BI на DWH | Self-service portal + доменные витрины |
| PHI в аналитике | PHI только в мед. домене; портал — агрегаты без карт |
| Синхронные интеграции | События + near-real-time потоки |
