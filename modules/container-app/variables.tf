variable "rg_name" { type = string }
variable "location" { type = string }
variable "name_prefix" { type = string }
variable "env_id" { type = string }
variable "name" { type = string }
variable "image" { type = string }
variable "cpu" { type = number default = 0.5 }
variable "memory_gb" { type = number default = 1 }
variable "min_replicas" { type = number default = 0 }
variable "max_replicas" { type = number default = 1 }
variable "ingress" {
type = object({
external = bool
target_port = number
transport = optional(string, "auto")
})
}
variable "env_vars" { type = map(string) default = {} }
variable "create_uami" { type = bool default = true }
variable "acr_login" { type = string default = null }
variable "acr_id" { type = string default = null }
variable "tags" { type = map(string) default = {} }