module "appstream-management" {
  source           = "./modules/appstream-fleets"
  stack_name       = var.mgmt_stack_name
  fleet_name       = var.mgmt_fleet_name
  fleet_type       = var.mgmt_fleet_type
  instance_type    = var.mgmt_instance_type
  image_name       = var.mgmt_image_name
  desired_capacity = var.mgmt_desired_capacity
  #directory_name   = var.directory_name
  #ou_name          = var.ou_name
  #ad_ip_address = var.ad_ip_address
  min_capacity  = var.mgmt_min_capacity
  max_capacity  = var.mgmt_max_capacity
  security_gp = module.sg_group.security_group
  #sg_provisioning = true
}

module "appstream-callcenter" {
  source           = "./modules/appstream-fleets"
  stack_name       = var.cc_stack_name
  fleet_name       = var.cc_fleet_name
  fleet_type       = var.cc_fleet_type
  instance_type    = var.cc_instance_type
  image_name       = var.cc_image_name
  desired_capacity = var.cc_desired_capacity
  #directory_name   = var.directory_name
  #ou_name          = var.ou_name
  #ad_ip_address = var.ad_ip_address
  min_capacity  = var.cc_min_capacity
  max_capacity  = var.cc_max_capacity
  #sg_provisioning = false
  security_gp = module.sg_group.security_group
}

module "appstream_idp"{
  source = "./modules/idp"
  saml_provider_provisioning = true
  saml_provider_name = "okta"
}

module "sg_group" {
  source = "./modules/security_group"
  ad_ip_address = var.ad_ip_address
}