# rg-logging
Tworzy Resource Group, Log Analytics i podstawową diagnostykę na RG.


## Wejścia
- `rg_name` (string)
- `location` (string)
- `name_prefix` (string)
- `log_retention_days` (number, default 30)
- `tags` (map(string))


## Wyjścia
- `rg_name`, `location`, `law_id`, `law_name`