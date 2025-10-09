variable "rg_name" {
 type = string
}
variable "location" {
 type = string
}
variable "name_prefix" {
 type = string
}
variable "log_retention_days" {
 type    = number
 default = 30
}
variable "tags" {
 type    = map(string)
 default = {}
}