# ai-foundry
Moduł tworzy Azure AI Foundry Hub (workspace kind="hub") oraz domyślny Project, z użyciem providera `azapi`.

## Wejścia
| Nazwa | Typ | Domyślna | Opis |
|------|-----|----------|------|
| rg_name | string | – | Grupa zasobów |
| location | string | – | Region Azure |
| name_prefix | string | – | Prefiks nazw (używany do nazwy huba) |
| tags | map(string) | {} | Tagi |
| hub_friendly_name | string | null | Przyjazna nazwa huba |
| hub_description | string | null | Opis huba |
| hub_public_network_access | string | "Enabled" | Dostęp publiczny (Enabled/Disabled) |
| hub_cmk_key_id | string | null | Opcjonalny Key Vault key URI do szyfrowania |
| default_project_name | string | – | Nazwa tworzonego projektu |
| project_description | string | null | Opis projektu |

## Wyjścia
| Nazwa | Opis |
|------|------|
| hub_id | Resource ID huba |
| hub_name | Nazwa huba |
| project_id | Resource ID projektu |
| project_name | Nazwa projektu |

## Przykład
```hcl
module "ai-foundry" {
  source      = "git::https://github.com/<org>/azure-tf-catalog//modules/ai-foudnry?ref=v0.2.0"
  rg_name     = var.rg_name
  location    = var.location
  name_prefix = var.name_prefix
  default_project_name = "firstProject"
  tags        = local.tags
}
```

Uwaga: Usługa może generować koszty zależnie od użytych zasobów/modeli.

