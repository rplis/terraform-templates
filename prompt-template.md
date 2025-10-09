# Prompt dla AI (IaC assembler)


Generuj **wyłącznie** Terraform używając poniższych modułów z tego repozytorium. Nie twórz surowych zasobów `azurerm_*`.

Zasady:
- Każdy `module` musi mieć `source = "git::https://github.com/<org>/azure-tf-catalog//modules/<mod>?ref=vX.Y.Z"`.
- Dodaj tagi: `project`, `env`, `owner`, `generated-by = "ai"`.
- Nie zapisuj sekretów wprost w HCL/TFVARS.
- Wygeneruj: `infra/{providers.tf,main.tf,variables.tf}` i `infra/envs/{dev.tfvars}`.
- Przypisz pola ze specyfikacji do wejść modułów. Nie dodawaj niesprecyzowanych zasobów.
- Zwróć wyłącznie zawartość plików, bez komentarza wokół.


Wejście (YAML):
<tu wklej zawartość infra.request.yaml>