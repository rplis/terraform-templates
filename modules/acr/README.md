# acr
Tworzy Azure Container Registry z automatycznym nazewnictwem.

## Wejścia
- `company` - Nazwa firmy do nazewnictwa zasobów
- `project` - Nazwa projektu do nazewnictwa zasobów  
- `environment` - Nazwa środowiska (np. dev, staging, prod)
- `rg_name` - Nazwa grupy zasobów
- `location` - Region Azure gdzie zasoby będą wdrożone
- `sku` (domyślnie Basic) - SKU dla ACR
- `admin_enabled` (domyślnie true) - Czy włączyć administratora
- `tags` - Tagi do zastosowania

## Nazewnictwo
Zasób będzie nazwany: `{company}{project}{environment}acr` (bez myślników)

## Wyjścia
- `name` - Nazwa ACR
- `login_server` - Serwer logowania ACR
- `id` - ID ACR