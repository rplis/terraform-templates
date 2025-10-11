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
  default     = "westeurope"
  description = "Azure region where the cognitive account will be deployed"
}


variable "public_network_access" {
  type        = string
  default     = "Enabled"
  description = "Public network access (Enabled/Disabled)"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Tags to apply to the cognitive account"
}


