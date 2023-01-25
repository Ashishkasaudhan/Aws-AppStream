module "appstream-management" {
  source           = "./modules/appstream-fleets"
  stack_name       = var.mgmt_stack_name
  fleet_name       = var.mgmt_fleet_name
  fleet_type       = var.mgmt_fleet_type
  instance_type    = var.mgmt_instance_type
  image_name       = var.mgmt_image_name
  desired_capacity = var.mgmt_desired_capacity
  min_capacity     = var.mgmt_min_capacity
  max_capacity     = var.mgmt_max_capacity

}