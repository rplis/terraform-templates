variable "rg_name" { type = string }
variable "location" { type = string }
variable "name_prefix" { type = string }
variable "sku" { type = string default = "Basic" }
variable "admin_enabled"{ type = bool default = false }
variable "tags" { type = map(string) default = {} }