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
variable "tenant_id" {
 type = string
}
variable "sku_name" {
 type    = string
 default = "standard"
}
variable "tags" {
 type    = map(string)
 default = {}
}