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
variable "address_space" {
 type = string
}
variable "subnets" {
 type    = map(string)
 default = {}
}
variable "tags" {
 type    = map(string)
 default = {}
}