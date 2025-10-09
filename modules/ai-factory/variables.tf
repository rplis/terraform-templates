variable "rg_name" {
  type = string
}
variable "location" {
  type = string
}
variable "account_name" {
  type = string
}
variable "tags" {
  type    = map(string)
  default = {}
}

// Cognitive Services account inputs
variable "sku_name" {
  type    = string
  default = "S0"
}

variable "public_network_access" {
  type    = string
  default = "Enabled" // Allowed: Enabled, Disabled
}

variable "custom_subdomain_name" {
  type    = string
  default = null
}

// Optional network ACLs
variable "enable_network_acls" {
  type    = bool
  default = false
}

variable "network_acls_default_action" {
  type    = string
  default = "Allow" // Allowed: Allow, Deny
}

variable "virtual_network_rules" {
  // list of objects with id and ignoreMissingVnetServiceEndpoint
  type = list(object({
    id                                        = string
    ignoreMissingVnetServiceEndpoint          = optional(bool)
  }))
  default = []
}

variable "ip_rules" {
  // list of objects with value and action
  type = list(object({
    value  = string
    action = optional(string)
  }))
  default = []
}


