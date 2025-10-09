variable "rg_name"     { type = string }
variable "location"    { type = string }
variable "name_prefix" { type = string }
variable "tags"        { type = map(string) default = {} }

// Hub-specific inputs
variable "hub_friendly_name" {
  type        = string
  default     = null
}

variable "hub_description" {
  type        = string
  default     = null
}

variable "hub_public_network_access" {
  type        = string
  default     = "Enabled" // Allowed: Enabled, Disabled
}

// Optional CMK key identifier (Key Vault key URI)
variable "hub_cmk_key_id" {
  type        = string
  default     = null
}

// Default project configuration
variable "default_project_name" {
  type = string
}

variable "project_description" {
  type    = string
  default = null
}


