variable "fleet_name" {
  type        = string
  description = "Name of the fleet"
}

variable "fleet_type" {
  type        = string
  description = "type of appstream fleet"
}

variable "instance_type" {
  type        = string
  description = "type of instance based on compute capacity needed"
}

variable "image_name" {
  type        = string
  description = "Name of the appstream image"
}

variable "saml_provider_provisioning"{
  type = bool
  description = "Whether IDP exists already"
  default = false
}

variable "sg_provisioning"{
  type = bool
  description = "Whether sg exists already"
  default = false
}

/*
variable "directory_name" {
  type        = string
  description = "Name of the Active Directory"
}

variable "ou_name" {
  type        = list(string)
  description = "Organization unit inside Active Directory to host AppStream objects"
}
*/

variable "max_capacity" {
  type        = number
  description = "Maximum number of AppStream Instances"
}

variable "min_capacity" {
  type        = number
  description = "Minimum number of AppStream Instances"
}

variable "desired_capacity" {
  type        = number
  description = "Desired number of AppStream Instances"
}

variable "stack_name" {
  type        = string
  description = "Name of the stack"
}


variable "security_gp" {
  description = "Security group to attach"
  
}