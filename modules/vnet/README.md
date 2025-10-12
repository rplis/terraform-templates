# vnet
Prosta VNet z podsieciami i automatycznym nazewnictwem. Użyj `subnets = { aca = "10.20.1.0/24" }` aby dodać podsieć dla ACA.

## Wejścia
- `company` - Nazwa firmy do nazewnictwa zasobów
- `project` - Nazwa projektu do nazewnictwa zasobów  
- `environment` - Nazwa środowiska (np. dev, staging, prod)
- `rg_name` - Nazwa grupy zasobów
- `location` - Region Azure gdzie zasoby będą wdrożone
- `address_space` - Przestrzeń adresowa VNet (np. "10.0.0.0/16")
- `subnets` - Mapa podsieci (np. { aca = "10.20.1.0/24" })
- `tags` - Tagi do zastosowania

## Nazewnictwo
VNet będzie nazwana: `{company}-{project}-{environment}-vnet`

## Wyjścia
- `vnet_id` - ID VNet
- `subnets` - Mapa podsieci z ich właściwościami