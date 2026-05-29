# План управления рисками

## R1 - Утечка PHI в витрину

| | |
|--|--|
| **Митигация (техн.)** | Классификация данных, column-level security, автоматические policy-тесты в CI data pipelines; запрет полей EHR в контрактах data products |
| **Митигация (управл.)** | Data Governance Council, DPO review перед публикацией витрины |
| **Владелец** | CDO / архитектор данных |

## R2 - Расхождение DWH и Data Mesh

| | |
|--|--|
| **Техн.** | Единый каталог схем, reconciliation jobs, CDC с контрольными суммами; постепенное отключение трансформаций в DWH |
| **Управл.** | Roadmap с датой «stop writing to DWH» по доменам |
| **Владелец** | Enterprise Architect |

## R3 - Нехватка компетенций

| | |
|--|--|
| **Техн.** | Пилот 1–2 домена, внутрение guild'ы, шаблоны (golden paths) |
| **Управл.** | Обучение, найм platform team, внешние консультанты на этап 1 (0–6 мес.) |
| **Владелец** | CTO |

## R4 - Простой клиник при миграции EHR

| | |
|--|--|
| **Техн.** | Strangler Fig, blue-green для UI, read-only режим, rollback |
| **Управл.** | Миграция по клиникам, окна обслуживания, war room |
| **Владелец** | Head of Clinical IT |

## R5 - Регуляторное несоответствие

| | |
|--|--|
| **Техн.** | Шифрование at rest/transit, audit log, geo-резиденция данных РФ |
| **Управл.** | Compliance checklist на каждый релиз, penetration test |
| **Владелец** | CISO |

## R6 - Vendor lock-in

| | |
|--|--|
| **Техн.** | Kubernetes, S3 API, open formats (Parquet, Avro), multi-cloud IaC modules |
| **Управл.** | Exit strategy в контракте |
| **Владелец** | Infrastructure Lead |

## R7 - Сопротивление Data Mesh

| | |
|--|--|
| **Техн.** | Self-service tooling, SLA на data products |
| **Управл.** | KPI доменов на качество данных, федеративная модель владения |
| **Владелец** | CDO |

## R8 - Dual-write Camel + Kafka

| | |
|--|--|
| **Техн.** | ACL, idempotent consumers, DLQ, ограниченный срок dual-write |
| **Управл.** | Жёсткий deadline отключения синхронных маршрутов |
| **Владелец** | Integration Architect |

## R9 - Scope creep

| | |
|--|--|
| **Управл.** | Этапность (6 / 18 / 36 мес.), architecture board, MVP витрины |
| **Владелец** | Program Manager |

## R10 - Отказ BI до готовности портала

| | |
|--|--|
| **Техн.** | Параллельный запуск портала и Power BI до parity отчётов |
| **Управл.** | Sign-off бизнесом по каждому отчёту перед decommission |
| **Владелец** | BI Lead |

## Мониторинг рисков

- Ежемесячный architecture review с обновлением матрицы.
- Метрики: % событий через Kafka vs Camel, data quality score, incident count PHI.
