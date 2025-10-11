# ai-foundry
Moduł tworzy Azure Cognitive Services Account dla AI Foundry.

## Wejścia
| Nazwa | Typ | Domyślna | Opis |
|------|-----|----------|------|
| environment | string | – | Nazwa środowiska (np. dev, staging, prod) |
| rg_name | string | – | Nazwa grupy zasobów |
| location | string | "westeurope" | Region Azure |
| name_prefix | string | – | Prefiks nazw zasobów |
| public_network_access | string | "Enabled" | Dostęp publiczny (Enabled/Disabled) |
| tags | map(string) | {} | Tagi do zastosowania na koncie Cognitive Services |

## Wyjścia
| Nazwa | Opis |
|------|------|
| cognitive_account_id | Resource ID konta Cognitive Services |
| cognitive_account_name | Nazwa konta Cognitive Services |
| primary_access_key | Klucz dostępu podstawowy |
| secondary_access_key | Klucz dostępu pomocniczy |
| endpoint | Endpoint konta Cognitive Services |

## Przykład
```hcl
module "ai-foundry" {
  source                = "git::https://github.com/<org>/azure-tf-catalog//modules/ai-foundry?ref=v0.2.0"
  environment           = var.environment
  rg_name               = var.rg_name
  location              = var.location
  name_prefix           = var.name_prefix
  public_network_access = "Enabled"
}
```

Uwaga: Usługa może generować koszty zależnie od użytych zasobów/modeli.

