# key-vault
Key Vault z włączoną ochroną przed usunięciem i automatycznym nazewnictwem. Uprawnienia użytkowników i tożsamości aplikacji dodaj w projekcie.

## Wejścia
- `company` - Nazwa firmy do nazewnictwa zasobów
- `project` - Nazwa projektu do nazewnictwa zasobów  
- `environment` - Nazwa środowiska (np. dev, staging, prod)
- `rg_name` - Nazwa grupy zasobów
- `location` - Region Azure gdzie zasoby będą wdrożone
- `tenant_id` - ID dzierżawy Azure
- `sku_name` (domyślnie standard) - SKU dla Key Vault
- `tags` - Tagi do zastosowania

## Nazewnictwo
Zasób będzie nazwany: `{company}{project}{environment}kv` (bez myślników)

## Wyjścia
- `id` - ID Key Vault
- `name` - Nazwa Key Vault