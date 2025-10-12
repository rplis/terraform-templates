# ai-foundry
Moduł tworzy Azure Cognitive Services Account dla AI Foundry z automatycznym nazewnictwem.

## Wejścia
| Nazwa | Typ | Domyślna | Opis |
|------|-----|----------|------|
| company | string | – | Nazwa firmy do nazewnictwa zasobów |
| project | string | – | Nazwa projektu do nazewnictwa zasobów |
| environment | string | – | Nazwa środowiska (np. dev, staging, prod) |
| rg_name | string | – | Nazwa grupy zasobów |
| location | string | "westeurope" | Region Azure |
| custom_subdomain_name | string | – | Nazwa niestandardowej domeny dla usług AI |
| public_network_access | string | "Enabled" | Dostęp publiczny (Enabled/Disabled) |
| network_acls_bypass | string | "" | Ustawienie obejścia ACL sieciowych |
| network_acls_default_action | string | "Allow" | Domyślna akcja ACL sieciowych |
| network_acls_ip_rules | list(string) | [] | Reguły IP dla ACL sieciowych |
| tags | map(string) | {} | Tagi do zastosowania na koncie Cognitive Services |

## Nazewnictwo
Konto AI Services będzie nazwane: `{company}-{project}-{environment}-ai`

## Wyjścia
| Nazwa | Opis |
|------|------|
| ai_services_id | Resource ID konta AI Services |
| ai_services_name | Nazwa konta AI Services |
| primary_access_key | Klucz dostępu podstawowy |
| secondary_access_key | Klucz dostępu pomocniczy |
| endpoint | Endpoint konta AI Services |
| custom_subdomain_name | Nazwa niestandardowej domeny |
| fqdns | Lista FQDN |

## Przykład
```hcl
module "ai-foundry" {
  source                     = "git::https://github.com/<org>/azure-tf-catalog//modules/ai-foundry?ref=v0.2.0"
  company                    = "mycompany"
  project                    = "myproject"
  environment                = "dev"
  rg_name                    = var.rg_name
  location                   = var.location
  custom_subdomain_name      = var.custom_subdomain_name
  public_network_access      = "Enabled"
  network_acls_bypass        = ""
  network_acls_default_action = "Allow"
  network_acls_ip_rules      = []
  tags                       = local.tags
}
```

Uwaga: Usługa może generować koszty zależnie od użytych zasobów/modeli.

