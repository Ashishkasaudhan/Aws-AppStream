<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |
| <a name="provider_null"></a> [null](#provider\_null) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_appautoscaling_policy.appstream_policy_in](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/appautoscaling_policy) | resource |
| [aws_appautoscaling_policy.appstream_policy_out](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/appautoscaling_policy) | resource |
| [aws_appautoscaling_target.appstream_instances](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/appautoscaling_target) | resource |
| [aws_appstream_fleet.appstream_fleet](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/appstream_fleet) | resource |
| [aws_appstream_stack.appstream_stack](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/appstream_stack) | resource |
| [aws_cloudwatch_metric_alarm.app_scale_in](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_cloudwatch_metric_alarm.app_scale_out](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [null_resource.anno_associate_fleet_stack](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |
| [aws_subnets.private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnets) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_desired_capacity"></a> [desired\_capacity](#input\_desired\_capacity) | Desired number of AppStream Instances | `number` | n/a | yes |
| <a name="input_fleet_name"></a> [fleet\_name](#input\_fleet\_name) | Name of the fleet | `string` | n/a | yes |
| <a name="input_fleet_type"></a> [fleet\_type](#input\_fleet\_type) | type of appstream fleet | `string` | n/a | yes |
| <a name="input_image_name"></a> [image\_name](#input\_image\_name) | Name of the appstream image | `string` | n/a | yes |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | type of instance based on compute capacity needed | `string` | n/a | yes |
| <a name="input_max_capacity"></a> [max\_capacity](#input\_max\_capacity) | Maximum number of AppStream Instances | `number` | n/a | yes |
| <a name="input_min_capacity"></a> [min\_capacity](#input\_min\_capacity) | Minimum number of AppStream Instances | `number` | n/a | yes |
| <a name="input_saml_provider_provisioning"></a> [saml\_provider\_provisioning](#input\_saml\_provider\_provisioning) | Whether IDP exists already | `bool` | `false` | no |
| <a name="input_security_gp"></a> [security\_gp](#input\_security\_gp) | Security group to attach | `any` | n/a | yes |
| <a name="input_sg_provisioning"></a> [sg\_provisioning](#input\_sg\_provisioning) | Whether sg exists already | `bool` | `false` | no |
| <a name="input_stack_name"></a> [stack\_name](#input\_stack\_name) | Name of the stack | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_stack_arn"></a> [stack\_arn](#output\_stack\_arn) | ARN of the created appstream stack |
<!-- END_TF_DOCS -->
