mgmt_stack_name       = "management"
mgmt_fleet_name       = "management"
mgmt_fleet_type       = "ON_DEMAND"
mgmt_instance_type    = "stream.standard.large"
mgmt_image_name       = "test-chrome"
mgmt_desired_capacity = 3
mgmt_max_capacity     = 10
mgmt_min_capacity     = 3
#directory_name = "ad.devopscaptain.com"
#ou_name= ["OU=Fleet-Management,OU=App-Stream,DC=ad,DC=devopscaptain,DC=com"]

cc_stack_name       = "call-center"
cc_fleet_name       = "call-center"
cc_fleet_type       = "ALWAYS_ON"
cc_instance_type    = "stream.standard.medium"
cc_image_name       = "test-chrome-7zip"
cc_desired_capacity = 2
cc_max_capacity     = 10
cc_min_capacity     = 2
#directory_name = "ad.devopscaptain.com"
#ou_name= ["OU=Fleet-CallCenter,OU=App-Stream,DC=ad,DC=devopscaptain,DC=com"]

ad_ip_address = "10.109.96.0"