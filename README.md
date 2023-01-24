# Aws-AppStream
AppStream 2.0 is a fully managed service which can be configured for application streaming or for delivery of virtual desktops with selective persistence. When AppStream 2.0 is used for virtual desktops, saved files and application settings remain persistent between user sessions, and a fresh desktop is assigned to the user every time they log on.
This Code will Help you to setup Amazon Appstream 2.0 Environment. To know more about appstream, kindly go-throguh with following documents

#### https://medium.com/ashishkasaudhan/amazon-appstream-an-answer-to-on-prem-desktop-solution-over-cloud-855c43b66bcb
#### https://aws.amazon.com/appstream2/
## Pre-requisites
* An AWS Account
* A Ec2 instance with instance profile having access on Amazon App-Stream 2.0 service and For On-Prem instance an iam role.
* Vpc with 2 or More Public and Private Subnet with Appropriate tagging. These tags will be used in terraform code, to pull out vpc and subnet informatoin. 
* Terraform version greater/equal to 1.2.9.
* AwsCli 