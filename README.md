# azure-tf-catalog

Katalog modułów Terraform dla Azure używany przez ludzi i asystenta AI.

## Założenia
- Brak zdalnego state. Moduły są małe.
- Projekty konsumują moduły przez `source = "git::https://github.com/<org>/azure-tf-catalog//modules/<mod>"` (bez tagów, zawsze najnowsze).
- Wymuszone tagi zasobów: `project`, `env`, `owner`, `generated-by`.
- Sekrety nie trafiają do kodu. Jeśli konieczne, używamy Key Vault.

## Moduły
- `rg-logging`: Resource Group + Log Analytics + podstawowa diagnostyka na RG.
- `acr`: Azure Container Registry.
- `container-app-env`: Azure Container Apps Environment podpięty do Log Analytics.
- `container-app`: Pojedyncza aplikacja ACA, opcjonalna UAMI i dostęp do ACR.
- `vnet`: Prosta VNet z wybranymi podsieciami (stub).
- `key-vault`: Key Vault i podstawowe uprawnienia (stub).
- `ai-foundry`: Azure AI Foundry

