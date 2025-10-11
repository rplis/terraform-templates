variable "rg_name" {
  type        = string
  description = "Name of the resource group"
}

variable "location" {
  type        = string
  default     = "westeurope"
  description = "Azure region where the AI services will be deployed"
}

variable "name_prefix" {
  type        = string
  description = "Prefix for the AI services resource name"
}

variable "environment" {
  type        = string
  description = "Environment name (e.g., dev, staging, prod)"
}

variable "custom_subdomain_name" {
  type        = string
  description = "Custom subdomain name for the AI services"
}

variable "fqdns" {
  type        = list(string)
  default     = []
  description = "List of FQDNs for the AI services"
}

variable "local_authentication_enabled" {
  type        = bool
  default     = true
  description = "Enable local authentication"
}

variable "outbound_network_access_restricted" {
  type        = bool
  default     = false
  description = "Restrict outbound network access"
}

variable "public_network_access" {
  type        = string
  default     = "Enabled"
  description = "Public network access (Enabled/Disabled)"
}

variable "sku_name" {
  type        = string
  default     = "S0"
  description = "SKU name for the AI services"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Tags to apply to the AI services"
}

variable "identity_ids" {
  type        = list(string)
  default     = []
  description = "List of identity IDs for user assigned identity"
}

variable "identity_type" {
  type        = string
  default     = "SystemAssigned"
  description = "Type of identity (SystemAssigned, UserAssigned)"
}

variable "network_acls_bypass" {
  type        = string
  default     = ""
  description = "Network ACLs bypass setting"
}

variable "network_acls_default_action" {
  type        = string
  default     = "Allow"
  description = "Network ACLs default action"
}

variable "network_acls_ip_rules" {
  type        = list(string)
  default     = []
  description = "Network ACLs IP rules"
}


