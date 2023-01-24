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

