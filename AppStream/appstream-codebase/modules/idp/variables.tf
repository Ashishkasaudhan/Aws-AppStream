variable "saml_provider_provisioning"{
  type = bool
  description = "Whether IDP exists already"
  default = false
}

variable "saml_provider_name" {
  type        = string
  description = "name of the SAML identity provider"
}
