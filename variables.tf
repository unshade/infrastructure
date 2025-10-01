variable "infomaniak" {
  description = "Infomaniak API token and related info"
  type = object({
    token      = string
  })
}
