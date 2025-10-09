# <mod-name>
Krótki opis celu modułu.

## Wejścia
| Nazwa | Typ | Domyślna | Opis |
|------|-----|----------|------|
| rg_name | string | – | Grupa zasobów |
| location | string | – | Region Azure |
| name_prefix | string | – | Prefiks nazw |
| tags | map(string) | {} | Tagi |

## Wyjścia
| Nazwa | Opis |
|------|------|
| id | Resource ID |
| name | Nazwa zasobu |

## Przykład
```hcl
module "<mod-name>" {
  source      = "git::https://github.com/<org>/azure-tf-catalog//modules/<mod-name>"
  rg_name     = var.rg_name
  location    = var.location
  name_prefix = var.name_prefix
  tags        = local.tags
}
