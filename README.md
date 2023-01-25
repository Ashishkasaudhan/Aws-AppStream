# Aws-AppStream
AppStream 2.0 is a fully managed service which can be configured for application streaming or for delivery of virtual desktops with selective persistence. When AppStream 2.0 is used for virtual desktops, saved files and application settings remain persistent between user sessions, and a fresh desktop is assigned to the user every time they log on.
This Code will Help you to setup Amazon Appstream 2.0 Environment. To know more about appstream, kindly go-throguh with following documents

#### https://medium.com/ashishkasaudhan/amazon-appstream-an-answer-to-on-prem-desktop-solution-over-cloud-855c43b66bcb
#### https://aws.amazon.com/appstream2/
___
## Pre-requisites
* An AWS Account
* A Ec2 instance with instance profile having access on Amazon App-Stream 2.0 service and For On-Prem instance an iam role.
* Vpc with 2 or More Public and Private Subnet with Appropriate tagging. These tags will be used in terraform code, to pull out vpc and subnet information.
<img width="400" alt="image" src="https://user-images.githubusercontent.com/12654660/214388904-b2e445d1-2d18-4805-8cb7-a5da7a32b158.png">

* Terraform version greater/equal to 1.2.9.
* AwsCli 
___
## Terraform execution steps
* Clone the git repo.
* Update the variable into tfvars file as per your environment/requirement. 
* Push change to git repo.
* Go To AppStream-ImageBuilder Directory first. 
*  To initialize a working directory containing Terraform configuration files:

<pre><code>terraform init</pre></code>
<img width="400" alt="image" src="https://user-images.githubusercontent.com/12654660/214476219-5816128f-82da-4936-bd68-6f6dfad2ccd2.png">

* To validate the Terraform configuration

<pre><code>terraform validate</pre></code>
<img width="400" alt="image" src="https://user-images.githubusercontent.com/12654660/214476518-840397ad-dbdb-4e62-a862-4fa989042519.png">

* To format your Terraform code 

<pre><code>terraform fmt --recursive</pre></code>

* To create an execution plan, which lets you preview the changes to your infrastructure:

<pre><code>terraform plan</pre></code>
<img width="400" alt="image" src="https://user-images.githubusercontent.com/12654660/214476273-84aa69a2-9ca1-47c8-af39-5203809a536d.png">

### This will Create a Imagebuilder Instance which we are going to customize. For this demo, we are going to install notepad++. 
