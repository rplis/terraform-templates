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


