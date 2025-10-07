# container-app
Tworzy aplikację w Azure Container Apps. Opcjonalnie zakłada UAMI i przypisuje rolę AcrPull do wskazanego ACR.


## Wejścia
- `rg_name`, `location`, `name_prefix`, `env_id`, `name`, `image`
- `cpu`, `memory_gb`, `min_replicas`, `max_replicas`
- `ingress { external, target_port, transport }`
- `env_vars` (map)
- `create_uami` (bool), `acr_login` (string, opcjonalnie), `acr_id` (string, opcjonalnie)
- `tags`


## Wyjścia
- `fqdn`