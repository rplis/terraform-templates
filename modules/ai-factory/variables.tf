variable "rg_name" {
  type = string
}

variable "location" {
  type = string
}

variable "name" {
  type = string
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "custom_subdomain_name" {
  type        = string
  default     = ""
  description = "Custom subdomain name for the AI service"
}

variable "fqdns" {
  type        = list(string)
  default     = []
  description = "List of fully qualified domain names"
}

variable "local_authentication_enabled" {
  type        = bool
  default     = true
  description = "Whether local authentication is enabled"
}

variable "outbound_network_access_restricted" {
  type        = bool
  default     = false
  description = "Whether outbound network access is restricted"
}

variable "public_network_access" {
  type        = string
  default     = "Enabled"
  description = "Public network access setting (Enabled/Disabled)"
}

variable "sku_name" {
  type        = string
  default     = "S0"
  description = "SKU name for the AI service"
}

variable "identity_type" {
  description = "Managed identity type: SystemAssigned or UserAssigned"
  type        = string
  default     = "SystemAssigned"
}

variable "identity_ids" {
  description = "List of user-assigned identity resource IDs (required if identity_type is UserAssigned)"
  type        = list(string)
  default     = []
}

variable "network_acls_bypass" {
  type        = string
  default     = ""
  description = "Network ACLs bypass setting"
}

variable "network_acls_default_action" {
  type        = string
  default     = "Allow"
  description = "Network ACLs default action (Allow/Deny)"
}

variable "network_acls_ip_rules" {
  type        = list(string)
  default     = []
  description = "List of IP rules for network ACLs"
}


