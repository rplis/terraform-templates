# ai-factory
Moduł tworzy konto Azure AI Foundry jako zasób Cognitive Services (`Microsoft.CognitiveServices/accounts` z `kind = "AIServices"`) z użyciem providera `azapi`.

## Wejścia
| Nazwa | Typ | Domyślna | Opis |
|------|-----|----------|------|
| rg_name | string | – | Grupa zasobów |
| location | string | – | Region Azure |
| account_name | string | – | Nazwa konta AI Foundry |
| tags | map(string) | {} | Tagi |
| sku_name | string | "S0" | SKU konta |
| public_network_access | string | "Enabled" | Dostęp publiczny (Enabled/Disabled) |
| custom_subdomain_name | string | null | Własny subdomenowy prefix (jeśli wymagany) |
| enable_network_acls | bool | false | Włącza sekcję `networkAcls` |
| network_acls_default_action | string | "Allow" | Domyślna akcja ACL (Allow/Deny) |
| virtual_network_rules | list(object) | [] | Reguły VNet dla ACL |
| ip_rules | list(object) | [] | Reguły IP dla ACL |

## Wyjścia
| Nazwa | Opis |
|------|------|
| account_id | Resource ID konta |
| account_name | Nazwa konta |

## Przykład
```hcl
module "ai-factory" {
  source      = "git::https://github.com/<org>/azure-tf-catalog//modules/ai-factory?ref=v0.2.0"
  rg_name     = var.rg_name
  location    = var.location
  account_name = "aif-myapp-dev"
  tags        = local.tags
}
```

Uwaga: Usługa może generować koszty zależnie od użytych zasobów/modeli.

