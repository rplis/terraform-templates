# Summary
Dodaje moduł `ai-factory` tworzący Azure AI Foundry Hub (ML workspace kind="hub") oraz domyślny Project z użyciem providera `azapi`.

# Changes
- modules/ai-factory/{main.tf,variables.tf,outputs.tf,README.md}
- examples/ai-factory-minimal/{main.tf,README.md}

# Module interface
## Inputs
- rg_name (string)
- location (string)
- name_prefix (string)
- tags (map(string), default = {})
- hub_friendly_name (string, default = null)
- hub_description (string, default = null)
- hub_public_network_access (string, default = "Enabled")
- hub_cmk_key_id (string, default = null)
- default_project_name (string)
- project_description (string, default = null)

## Outputs
- hub_id, hub_name, project_id, project_name

# Backward compatibility
Nowy moduł — brak wpływu na istniejące.

# Test plan
- terraform fmt -check
- terraform validate
- tflint
- checkov -d .
- terraform plan w `examples/ai-factory-minimal`

# Cost note
Koszty zależą od użycia usług i modeli w ramach AI Foundry.

# Tagging
Proponowany tag: `v0.2.0`

```bash
git tag v0.2.0
git push origin v0.2.0
```

# Checklist
- [ ] README modułu
- [ ] Variables/Outputs kompletne
- [ ] Example działa (init/plan)
- [ ] Linty i validate przechodzą

