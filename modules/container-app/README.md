# container-app
Tworzy aplikację w Azure Container Apps z automatycznym nazewnictwem. Opcjonalnie zakłada UAMI i przypisuje rolę AcrPull do wskazanego ACR.

## Wejścia
- `company` - Nazwa firmy do nazewnictwa zasobów
- `project` - Nazwa projektu do nazewnictwa zasobów  
- `environment` - Nazwa środowiska (np. dev, staging, prod)
- `rg_name` - Nazwa grupy zasobów
- `location` - Region Azure gdzie zasoby będą wdrożone
- `env_id` - ID środowiska Container Apps
- `app_name` - Nazwa aplikacji (połączona z company/project/environment)
- `image` - Obraz kontenera
- `cpu`, `memory_gb`, `min_replicas`, `max_replicas` - Konfiguracja zasobów
- `ingress { external, target_port, transport }` - Konfiguracja ingress
- `env_vars` (map) - Zmienne środowiskowe
- `create_uami` (bool) - Czy utworzyć UAMI
- `acr_login` (string, opcjonalnie) - Login server ACR
- `acr_id` (string, opcjonalnie) - ID ACR
- `tags` - Tagi do zastosowania

## Nazewnictwo
Aplikacja będzie nazwana: `{company}-{project}-{environment}-{app_name}`
UAMI będzie nazwana: `{company}-{project}-{environment}-{app_name}-uami`

## Wyjścia
- `fqdn` - Pełna nazwa domeny aplikacji