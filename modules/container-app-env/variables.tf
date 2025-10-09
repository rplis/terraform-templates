variable "rg_name" {
 type = string
}
variable "location" {
 type = string
}
variable "name_prefix" {
 type = string
}
variable "law_id" {
 type = string
}
variable "tags" {
 type    = map(string)
 default = {}
}
variable "infrastructure_subnet_id" {
 type    = string
 default = null
}