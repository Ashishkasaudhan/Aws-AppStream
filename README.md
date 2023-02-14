# Aws-AppStream
AppStream 2.0 is a fully managed service that can be configured for application streaming or for delivery of virtual desktops with selective persistence. When AppStream 2.0 is used for virtual desktops, saved files and application settings remain persistent between user sessions, and a fresh desktop is assigned to the user every time they log on. This Code will help you to set up the Amazon App stream 2.0 Environment. To know more about app stream, kindly go-through with the following documents.

#### [Amazon AppStream 2.0 By Ashish Kasaudhan]( https://medium.com/ashishkasaudhan/amazon-appstream-an-answer-to-on-prem-desktop-solution-over-cloud-855c43b66bcb).
#### [Amazon AppStream 2.0]( https://aws.amazon.com/appstream2/)
___
## Pre-Requisites
* An AWS Account
* An Ec2 instance with an instance profile having access to Amazon App-Stream 2.0 service and For an On-Prem instance an IAM role.
* Vpc with 2 or More Public and Private Subnet with Appropriate tagging. These tags will be used in terraform code, to pull out vpc and subnet information.
<img width="400" alt="image" src="https://user-images.githubusercontent.com/12654660/214388904-b2e445d1-2d18-4805-8cb7-a5da7a32b158.png">

* Terraform version greater/equal to 1.2.9.
* AwsCli 
___
## Terraform Execution Steps To Create ImageBuilder
* Clone the git repo.
* Go To AppStream-ImageBuilder Directory. 
* Update the variable into tfvars file as per your environment/requirement. 
* Push change to git repo.
* To initialize a working directory containing Terraform configuration files:

<pre><code>terraform init</pre></code>
<img width="600" alt="image" src="https://user-images.githubusercontent.com/12654660/214476219-5816128f-82da-4936-bd68-6f6dfad2ccd2.png">

* To validate the Terraform configuration

<pre><code>terraform validate</pre></code>
<img width="600" alt="image" src="https://user-images.githubusercontent.com/12654660/214476518-840397ad-dbdb-4e62-a862-4fa989042519.png">

* To format your Terraform code 

<pre><code>terraform fmt --recursive</pre></code>

* To create an execution plan, which lets you preview the changes to your infrastructure:

<pre><code>terraform plan</pre></code>
<img width="600" alt="image" src="https://user-images.githubusercontent.com/12654660/216030735-b58f4441-958b-4d20-80a5-58c8f155df94.png">

<pre><code>terraform apply --auto-approve</pre></code>
<img width="600" alt="image" src="https://user-images.githubusercontent.com/12654660/216030735-b58f4441-958b-4d20-80a5-58c8f155df94.png">
After the successful execution of terraform Code Imagebuilder Instance gets created, which we are going to customize. For this demo, we are going to install notepad++. 

____

## Customize Image Builder Instance

* Go To APPStream 2.0 ----> Image Builders ----> Click on Start -----> After Start login as Administrator
<img width="600" alt="image" src="https://user-images.githubusercontent.com/12654660/214477805-c0c47f3d-c82e-449b-8741-e931640681f4.png">

* Download Notepad +++ from the internet and Install it on the image builder

* Follow the steps mentioned in (https://docs.aws.amazon.com/appstream2/latest/developerguide/tutorial-image-builder.html) to create image.We are tagging our image as Notepad.
<img width="600" alt="image" src="https://user-images.githubusercontent.com/12654660/214479389-a5efb77c-472b-46bb-8fce-212ea57c001c.png">

___
## Terraform Execution Steps To Create Amazon AppStream 2.0 Stack And Fleet
* Clone the git repo.
* Go To AppStream Directory.
* Update the variable into tfvars file as per your environment/requirement. 
* Push change to git repo.
* To initialize a working directory containing Terraform configuration files:

<pre><code>terraform init</pre></code>

* To validate the Terraform configuration

<pre><code>terraform validate</pre></code>

* To format your Terraform code 

<pre><code>terraform fmt --recursive</pre></code>

* To create an execution plan, which lets you preview the changes to your infrastructure:

<pre><code>terraform plan</pre></code>
<img width="600" alt="image" src="https://user-images.githubusercontent.com/12654660/214483619-c08225c0-b915-47b1-9ff2-e74f72461084.png">

<pre><code>terraform apply --auto-approve</pre></code>

After the successful execution of terraform Code Amazon AppStream fleet and stack gets created.

<img width="600" alt="image" src="https://user-images.githubusercontent.com/12654660/214484410-b8a9e71a-9828-483f-8749-b2b0e832e6ae.png">

<img width="600" alt="image" src="https://user-images.githubusercontent.com/12654660/214484431-2e26763d-7bb7-4a2c-b302-3ffb9c4fc4a1.png">
*  Once everything becomes available, login into AppStream Stack.

<img width="600" alt="image" src="https://user-images.githubusercontent.com/12654660/214484832-3f65eef5-d776-4b71-a462-200805dff28d.png">

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | = 1.2.9 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.20.1 |

## Modules

AppStream/modules/appstream-fleets

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="mgmt_stack_name"></a> [mgmt\_stack\_name](#input\_mgmt\_stack\_name) |Name of AppStream Stack | `string` | `""` | yes |
| <a name="mgmt_fleet_name"></a> [mgmt\_fleet\_name](#input\_mgmt\_fleet\_name) |Name of AppStream Fleet | `string` | `""` | yes |
| <a name="mgmt_fleet_type"></a> [mgmt\_fleet\_type](#input\_mgmt\_fleet\_type) |Name of AppStream Type | `string` | `""` | yes |
| <a name="mgmt_instance_type "></a> [mgmt\_instance\_name](#input\_mgmt\_instance\_name) |Type of AppStream Instance | `string` | `""` | yes |
| <a name="mgmt_image_name"></a> [mgmt\_image\_name](#input\_mgmt\_image\_name) |Name of AppStream Image create via image builder | `string` | `""` | yes |
| <a name="mgmt_desired_capacity"></a> [mgmt\_desired\_capacity](#input\_mgmt\_desired\_capacity) |Desired Number of AppStream Instance | `number` | `""` | yes |
| <a name="mgmt_max_capacity"></a> [mgmt\_max\_capacity](#input\_mgmt\_max\_capacity) |Maximum Number of AppStream Instance | `number` | `""` | yes |
| <a name="mgmt_min_capacity"></a> [mgmt\_min\_capacity](#input\_mgmt\_min\_capacity) |Minimum Number of AppStream Instance | `number` | `""` | yes |
| <a name="image_name"></a> [image\_name](#input\_image\_name) |Base Image for ImageBuilder | `string` | `""` | yes |
| <a name="instance_type"></a> [instance\_type](#input\_instance\_type) |Instance Type for Imagebuilder Instance | `string` | `""` | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="stack_arn"></a> [stack_arn](#output\_stack_arn) | ARN of the created appstream stack. |
| <a name="imagebuilder_arn"></a> [imagebuilder_arn](#output\_aws_appstream_image_builder.test.arn) | ARN of the created imagebuilder instance. |
| <a name="imagebuilder_id"></a> [imagebuilder_id](#output\_aws_appstream_image_builder.test.id) | Name of the created imagebuilder instance. |

___
For more information on Amazon AppStream 2.0 , visit [Amazon AppStream 2.0 By Ashish Kasaudhan]( https://medium.com/ashishkasaudhan/amazon-appstream-an-answer-to-on-prem-desktop-solution-over-cloud-855c43b66bcb).

For more information on Amazon AppStream 2.0, visit [Amazon AppStream 2.0]( https://aws.amazon.com/appstream2/).
