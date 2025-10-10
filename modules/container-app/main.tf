terraform {
  required_providers {
    azurerm = {
      source  = "azurerm"
      version = "4.40.0"
    }
  }
}

provider "azurerm" {
  features {}
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
  container_app_environment_id  = var.env_id
  custom_domain_verification_id = var.custom_domain_verification_id
  max_inactive_revisions        = var.max_inactive_revisions
  name                          = var.name
  resource_group_name           = var.rg_name
  revision_mode                 = "Single"
  tags                          = var.tags
  workload_profile_name         = var.workload_profile_name

  ingress {
    allow_insecure_connections = var.ingress.allow_insecure_connections
    client_certificate_mode    = var.ingress.client_certificate_mode
    exposed_port               = var.ingress.exposed_port
    external_enabled           = var.ingress.external
    target_port                = var.ingress.target_port
    transport                  = var.ingress.transport

    traffic_weight {
      label           = var.ingress.traffic_weight_label
      latest_revision = true
      percentage      = 100
      revision_suffix = var.ingress.traffic_weight_revision_suffix
    }
  }

  dynamic "registry" {
    for_each = var.acr_login != null ? [1] : []
    content {
      identity             = var.create_uami ? azurerm_user_assigned_identity.uami[0].id : "system-environment"
      password_secret_name = var.registry_password_secret_name
      server               = var.acr_login
      username             = var.registry_username
    }
  }

  template {
    max_replicas                     = var.max_replicas
    min_replicas                     = var.min_replicas
    revision_suffix                  = var.template_revision_suffix
    termination_grace_period_seconds = var.termination_grace_period_seconds

    container {
      args    = var.container_args
      command = var.container_command
      cpu     = var.cpu
      image   = var.image
      memory  = "${var.memory_gb}Gi"
      name    = var.container_name

      dynamic "env" {
        for_each = var.env_vars
        content {
          name        = env.key
          secret_name = env.value.secret_name
          value       = env.value.value
        }
      }
    }
  }

  identity {
    type = var.create_uami ? "UserAssigned" : "SystemAssigned"
    identity_ids = var.create_uami ? [azurerm_user_assigned_identity.uami[0].id] : null
  }
}