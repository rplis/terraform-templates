variable "rg_name" { type = string }
variable "location" { type = string }
variable "name_prefix" { type = string }
variable "address_space" { type = string }
variable "subnets" { type = map(string) default = {} }
variable "tags" { type = map(string) default = {} }