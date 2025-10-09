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

## Jak używać z AI
1. W projekcie przygotuj plik `infra.request.yaml` zgodny z przykładem w `examples/aca-acr-logging/`.
2. Skopiuj treść `prompt-template.md`, wklej do modelu i podmień listę modułów na konkretne tagi, które chcesz.
3. Wklej treść `infra.request.yaml` jako wejście.
4. Oczekuj, że AI zwróci katalog `infra/` (providers.tf, main.tf, variables.tf) oraz `infra/envs/<env>.tfvars`.
5. Uruchom `terraform -chdir=infra init && terraform -chdir=infra plan -var-file=infra/envs/<env>.tfvars`.

## Dobre praktyki
- Providerów i modułów nie pinujemy — korzystamy z najnowszych.
- Komituj `.terraform.lock.hcl` w repo aplikacji.
- Używaj `tflint`, `checkov/tfsec` i `terraform validate` w CI.
- Nie przechowuj sekretów w `tfvars`. Zawsze przez Key Vault.
