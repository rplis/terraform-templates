variable "company" {
  type        = string
  description = "Company name for resource naming"
}

variable "project" {
  type        = string
  description = "Project name for resource naming"
}

variable "environment" {
  type        = string
  description = "Environment name (e.g., dev, staging, prod)"
}

variable "rg_name" {
  type        = string
  description = "Name of the resource group"
}

variable "location" {
  type        = string
  description = "Azure region where resources will be deployed"
}

variable "env_id" {
  type        = string
  description = "Container App Environment ID"
}

variable "app_name" {
  type        = string
  description = "Application name (will be combined with company/project/environment for full name)"
}
variable "image" {
 type = string
}
variable "cpu" {
 type    = number
 default = 0.5
}
variable "memory_gb" {
 type    = number
 default = 1
}
variable "min_replicas" {
 type    = number
 default = 0
}
variable "max_replicas" {
 type    = number
 default = 1
}
variable "ingress" {
  type = object({
    external                        = bool
    target_port                     = number
    transport                       = optional(string, "auto")
    allow_insecure_connections      = optional(bool, false)
    client_certificate_mode         = optional(string, "ignore")
    traffic_weight_label            = optional(string, "default")
    traffic_weight_revision_suffix  = optional(string, "latest")
  })
}
variable "env_vars" {
  type = map(object({
    value       = optional(string, "")
    secret_name = optional(string, "")
  }))
  default = {}
}
variable "create_uami" {
 type    = bool
 default = true
}
variable "acr_login" {
 type    = string
 default = null
}
variable "acr_id" {
 type    = string
 default = null
}
variable "tags" {
  type    = map(string)
  default = {}
}


variable "max_inactive_revisions" {
  type        = number
  default     = 100
  description = "Maximum number of inactive revisions to keep"
}

variable "workload_profile_name" {
  type        = string
  default     = null
  description = "Workload profile name"
}

variable "registry_password_secret_name" {
  type        = string
  default     = ""
  description = "Registry password secret name"
}

variable "registry_username" {
  type        = string
  default     = ""
  description = "Registry username"
}

variable "template_revision_suffix" {
  type        = string
  default     = ""
  description = "Template revision suffix"
}

variable "termination_grace_period_seconds" {
  type        = number
  default     = 0
  description = "Termination grace period in seconds"
}

variable "container_args" {
  type        = list(string)
  default     = []
  description = "Container arguments"
}

variable "container_command" {
  type        = list(string)
  default     = []
  description = "Container command"
}

variable "container_name" {
  type        = string
  default     = "app"
  description = "Container name"
}