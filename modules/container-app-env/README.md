# container-app-env
Tworzy Azure Container Apps Environment z automatycznym nazewnictwem, połączone z Log Analytics. Opcjonalnie może być osadzone w podsieci.

## Wejścia
- `company` - Nazwa firmy do nazewnictwa zasobów
- `project` - Nazwa projektu do nazewnictwa zasobów  
- `environment` - Nazwa środowiska (np. dev, staging, prod)
- `rg_name` - Nazwa grupy zasobów
- `location` - Region Azure gdzie zasoby będą wdrożone
- `law_id` - ID Log Analytics Workspace
- `infrastructure_subnet_id` (opcjonalne) - ID podsieci infrastruktury
- `tags` - Tagi do zastosowania

## Nazewnictwo
Environment będzie nazwany: `{company}-{project}-{environment}-acae`

## Wyjścia
- `env_id` - ID środowiska Container Apps