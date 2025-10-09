terraform {
required_providers {
 azurerm = {
  source = "hashicorp/azurerm"
 }
}
}


resource "azurerm_user_assigned_identity" "uami" {
count = var.create_uami ? 1 : 0
name = "${var.name_prefix}-uami"
location = var.location
resource_group_name = var.rg_name
tags = var.tags
}


resource "azurerm_role_assignment" "acr_pull" {
count = var.create_uami && var.acr_id != null ? 1 : 0
scope = var.acr_id
role_definition_name = "AcrPull"
principal_id = azurerm_user_assigned_identity.uami[0].principal_id
}


resource "azurerm_container_app" "app" {
name = var.name
resource_group_name = var.rg_name
container_app_environment_id = var.env_id
revision_mode = "Single"
tags = var.tags


template {
container {
name = "app"
image = var.image
cpu = var.cpu
memory = "${var.memory_gb}Gi"


dynamic "env" {
for_each = var.env_vars
content {
name = env.key
value = env.value
}
}
}


min_replicas = var.min_replicas
max_replicas = var.max_replicas
}


identity {
type = var.create_uami ? "UserAssigned" : "SystemAssigned"
identity_ids = var.create_uami ? [azurerm_user_assigned_identity.uami[0].id] : null
}


ingress {
external_enabled = var.ingress.external
target_port = var.ingress.target_port
transport = var.ingress.transport


traffic_weight {
latest_revision = true
percentage = 100
}
}


dynamic "registry" {
for_each = var.acr_login != null && var.create_uami ? [1] : []
content {
server = var.acr_login
identity = azurerm_user_assigned_identity.uami[0].id
}
}
}