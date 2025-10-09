variable "rg_name" {
 type = string
}
variable "location" {
 type = string
}
variable "name_prefix" {
 type = string
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