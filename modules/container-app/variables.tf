variable "rg_name" {
 type = string
}
variable "location" {
 type = string
}
variable "name_prefix" {
 type = string
}
variable "env_id" {
 type = string
}
variable "name" {
 type = string
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
    exposed_port                    = optional(number, 0)
    traffic_weight_label            = optional(string, "")
    traffic_weight_revision_suffix  = optional(string, "")
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
  default     = ""
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