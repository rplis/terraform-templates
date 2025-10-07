variable "rg_name"     { type = string }
variable "location"    { type = string }
variable "name_prefix" { type = string }
variable "tags"        { type = map(string) default = {} }

# tu specyficzne wejścia modułu z domyślnymi wartościami
# variable "sku" { type = string default = "Basic" }
