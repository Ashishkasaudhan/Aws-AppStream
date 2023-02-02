<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | = 1.2.9 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 4.20.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.20.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_appstream_image_builder.test](https://registry.terraform.io/providers/hashicorp/aws/4.20.1/docs/resources/appstream_image_builder) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/4.20.1/docs/data-sources/caller_identity) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/4.20.1/docs/data-sources/region) | data source |
| [aws_security_groups.appstream](https://registry.terraform.io/providers/hashicorp/aws/4.20.1/docs/data-sources/security_groups) | data source |
| [aws_subnets.private](https://registry.terraform.io/providers/hashicorp/aws/4.20.1/docs/data-sources/subnets) | data source |
| [aws_vpc.vpc](https://registry.terraform.io/providers/hashicorp/aws/4.20.1/docs/data-sources/vpc) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_image_name"></a> [image\_name](#input\_image\_name) | Name of the image-builder image | `string` | n/a | yes |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | Name of the image-builder instance type | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_imagebuilder_arn"></a> [imagebuilder\_arn](#output\_imagebuilder\_arn) | ARN of the created imagebuilder instance |
| <a name="output_imagebuilder_id"></a> [imagebuilder\_id](#output\_imagebuilder\_id) | Name of the created imagebuilder instance |
<!-- END_TF_DOCS -->
