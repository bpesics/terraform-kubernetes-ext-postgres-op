variable "name_prefix" {
  type = string
}

variable "db_attributes" {
  type = object({
    host       = string
    port       = string
    user       = string
    password   = string
    default_db = string
    admin_uri  = string
  })
}

variable "additional_env_vars" {
  type = map(string)
}
