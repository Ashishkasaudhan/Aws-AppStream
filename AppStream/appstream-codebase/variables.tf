variable "mgmt_fleet_name" {
  type        = string
  description = "Name of the fleet"
}

variable "mgmt_fleet_type" {
  type        = string
  description = "type of appstream fleet"
}

variable "mgmt_instance_type" {
  type        = string
  description = "type of instance based on compute capacity needed"
}

variable "mgmt_image_name" {
  type        = string
  description = "Name of the appstream image"
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

variable "mgmt_max_capacity" {
  type        = number
  description = "Maximum number of AppStream Instances"
}

variable "mgmt_min_capacity" {
  type        = number
  description = "Minimum number of AppStream Instances"
}

variable "mgmt_desired_capacity" {
  type        = number
  description = "Desired number of AppStream Instances"
}

variable "mgmt_stack_name" {
  type        = string
  description = "Name of the stack"
}

variable "ad_ip_address" {
  type        = string
  description = "IP address of active directory"
}

variable "cc_fleet_name" {
  type        = string
  description = "Name of the fleet"
}

variable "cc_fleet_type" {
  type        = string
  description = "type of appstream fleet"
}

variable "cc_instance_type" {
  type        = string
  description = "type of instance based on compute capacity needed"
}

variable "cc_image_name" {
  type        = string
  description = "Name of the appstream image"
}

variable "cc_max_capacity" {
  type        = number
  description = "Maximum number of AppStream Instances"
}

variable "cc_min_capacity" {
  type        = number
  description = "Minimum number of AppStream Instances"
}

variable "cc_desired_capacity" {
  type        = number
  description = "Desired number of AppStream Instances"
}

variable "cc_stack_name" {
  type        = string
  description = "Name of the stack"
}