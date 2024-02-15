variable "access_key" {
  description = "access_key"
  type        = string
  sensitive   = true # Oculta los valores en consola
  default     = ""
}
variable "secret_key" {
  description = "secret_key"
  type        = string
  sensitive   = true # Oculta los valores en consola
  default     = ""
}
