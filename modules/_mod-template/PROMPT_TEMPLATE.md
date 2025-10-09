Jesteś asystentem IaC. Twoim zadaniem jest dodać NOWY moduł Terraform do repozytorium „azure-tf-catalog”.

Kontekst i zasady:
- Twórz wyłącznie pliki i treści wymienione niżej. Brak komentarzy, brak wyjaśnień w tekście poza README modułu i PR opisem.
- Język: HCL dla kodu, Markdown dla README.
- Provider: azurerm w wersji ~> 3.120, z "features {}".
- Konwencje wejść modułu: obowiązkowe `rg_name`, `location`, `name_prefix`, `tags` (map(string), default = {}).
- Zasoby Azure tworzysz tylko wewnątrz modułu. Integracje z innymi modułami realizujesz wejściami typu `*_id`, `*_name`.
- Nazewnictwo zasobów bazuj na `name_prefix` i krótkich sufiksach.
- Zero sekretów i wrażliwych danych w kodzie i tfvars.
- Outputs zawierają kluczowe identyfikatory i endpointy (np. `id`, `name`, `host`, `connection_*` jeśli dotyczy).
- Zadbaj o sensowne wartości domyślne wejść specyficznych dla usługi.
- Dodaj krótkie ostrzeżenie kosztowe w README, jeśli zasób ma płatne SKU.
- SemVer: to jest wersja MINOR, zakładamy brak zmian łamiących interfejsy. Zaproponuj tag w formie `v<MAJOR>.<MINOR+1>.0` i podaj komendy git do nadania tagu.

Wejście opisujące nowy moduł:
- Nazwa modułu (katalog): <MODULE_SLUG>          # np. "redis" albo "storage-account"
- Cel usługi: <SERVICE_SUMMARY>                   # 1–2 zdania
- Zasób bazowy: <AZURERM_RESOURCE>               # np. "azurerm_redis_cache"
- Domyślne SKU/parametry: <DEFAULTS_NOTE>        # krótki opis domyślnych wartości
- Przykładowe użycie: podaj minimalny blok `module {}`

Wynik ma zawierać dokładnie te pliki i tylko je, w następujących sekcjach, każdą w oddzielnym bloku kodu z nagłówkiem ścieżki:

1) modules/<MODULE_SLUG>/main.tf
2) modules/<MODULE_SLUG>/variables.tf
3) modules/<MODULE_SLUG>/outputs.tf
4) modules/<MODULE_SLUG>/README.md            # Opis, tabela Wejścia/ Wyjścia, Przykład użycia, Notatka o kosztach jeśli istotna
5) examples/<MODULE_SLUG>-minimal/main.tf     # Minimalny przykład użycia modułu
6) examples/<MODULE_SLUG>-minimal/README.md   # Jak uruchomić: init/plan/apply oraz wymagane wartości
7) docs/PR_<MODULE_SLUG>.md                   # Propozycja opisu PR: zakres, interfejs, test plan, checklista jakości
8) prompt-template.patch.md                   # Fragment do dopięcia do istniejącego prompt-template.md: dodaj w „Dozwolone moduły i wersje” linię z nowym modułem i wersją

Wytyczne szczegółowe do zawartości:

- main.tf:
  - Blok `terraform` z wymaganym providerem.
  - Deklaracje zasobów `azurerm_*` dla <AZURERM_RESOURCE> i elementów wspierających.
  - Brak zależności bocznych na inne moduły poza wejściami.
  - Tagi przypisz z `var.tags`.

- variables.tf:
  - Zdefiniuj `rg_name`, `location`, `name_prefix`, `tags` oraz wejścia specyficzne dla usługi.
  - Każda zmienna ma typ, domyślną wartość jeśli zasadne i opis w komentarzu `//`.

- outputs.tf:
  - Eksportuj najistotniejsze pola: co najmniej `id` i `name`.

- README.md modułu:
  - Krótki opis.
  - Tabela Wejścia: nazwa, typ, domyślna, opis.
  - Tabela Wyjścia: nazwa, opis.
  - Przykład użycia bez tagów: `source = "git::https://github.com/<org>/azure-tf-catalog//modules/<MODULE_SLUG>"`.
  - Notatka o kosztach jeśli dotyczy.

- example:
  - `examples/<MODULE_SLUG>-minimal/main.tf` ma pokazać minimalne wartości wejść oraz lokalne `provider "azurerm" { features {} }`.
  - README z komendami: `terraform init`, `terraform plan`, `terraform apply`.

- docs/PR_<MODULE_SLUG>.md:
  - Sekcje: Summary, Changes, Module interface (Inputs/Outputs), Backward compatibility, Test plan (fmt, validate, tflint, checkov, plan), Cost note, Tagging (komendy git tag i push), Checklist.

- prompt-template.patch.md:
  - Krótki blok do wklejenia do głównego `prompt-template.md`, który dodaje w sekcji „Dozwolone moduły” pozycję: `- <MODULE_SLUG>`.

Format odpowiedzi:
- Dla każdego pliku wypisz nagłówek ścieżki w postaci komentarza Markdown, np. `# modules/<MODULE_SLUG>/main.tf`, a pod nim blok kodu z zawartością.
- Nie dodawaj żadnych innych komentarzy ani tekstu poza zawartością plików.

Teraz wygeneruj pliki dla:
- <MODULE_SLUG>: <WPISZ>
- <SERVICE_SUMMARY>: <WPISZ>
- <AZURERM_RESOURCE>: <WPISZ>
- <DEFAULTS_NOTE>: <WPISZ>
- Minimalny przykład użycia ma używać regionu "westeurope" i prostych wartości.
