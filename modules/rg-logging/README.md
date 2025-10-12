# rg-logging
Tworzy Resource Group, Log Analytics Workspace z automatycznym nazewnictwem i podstawową diagnostykę na RG.

## Wejścia
- `company` - Nazwa firmy do nazewnictwa zasobów
- `project` - Nazwa projektu do nazewnictwa zasobów  
- `environment` - Nazwa środowiska (np. dev, staging, prod)
- `rg_name` - Nazwa grupy zasobów
- `location` - Region Azure gdzie zasoby będą wdrożone
- `log_retention_days` (number, default 30) - Liczba dni przechowywania logów
- `tags` - Tagi do zastosowania

## Nazewnictwo
Log Analytics Workspace będzie nazwany: `{company}-{project}-{environment}-law`

## Wyjścia
- `rg_name` - Nazwa grupy zasobów
- `location` - Lokalizacja grupy zasobów
- `law_id` - ID Log Analytics Workspace
- `law_name` - Nazwa Log Analytics Workspace