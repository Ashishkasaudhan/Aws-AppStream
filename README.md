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
## Terraform execution steps to create ImageBuilder
* Clone the git repo.
* Go To AppStream-ImageBuilder Directory. 
* Update the variable into tfvars file as per your environment/requirement. 
* Push change to git repo.
* To initialize a working directory containing Terraform configuration files:

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

<pre><code>terraform apply --auto-approve</pre></code>
<img width="400" alt="image" src="https://user-images.githubusercontent.com/12654660/214476273-84aa69a2-9ca1-47c8-af39-5203809a536d.png">
After sucessful execution of terraform Code Imagebuilder Instance gets created, which we are going to customize. For this demo, we are going to install notepad++. 

____

## Customize Image Builder Instance

* Go To APPStream 2.0 ----> Image Builders ----> Click on Start -----> After Start login as Administrator
<img width="400" alt="image" src="https://user-images.githubusercontent.com/12654660/214477805-c0c47f3d-c82e-449b-8741-e931640681f4.png">

* Dowload Notepad +++ from internet and Install it on the image builder

* Follow the steps mentioned in https://docs.aws.amazon.com/appstream2/latest/developerguide/tutorial-image-builder.html to create image.We are tagging our image as Notepad.
<img width="600" alt="image" src="https://user-images.githubusercontent.com/12654660/214479389-a5efb77c-472b-46bb-8fce-212ea57c001c.png">

___
## Terraform execution steps to create Amazon AppStream 2.0 Stack and fleet
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

