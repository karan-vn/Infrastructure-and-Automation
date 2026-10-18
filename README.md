\# EC2 Nginx Deployment with Terraform



\## Project Overview



This project demonstrates Infrastructure as Code (IaC) using Terraform to deploy an Nginx web server on an AWS EC2 instance running Ubuntu 20.04 LTS.



The instance is configured automatically using EC2 user data, which installs Nginx and replaces the default index page with a custom HTML message.



\## Architecture



\- \*\*Cloud Provider:\*\* AWS

\- \*\*Region:\*\* Asia Pacific (Mumbai) — `ap-south-1`

\- \*\*Operating System:\*\* Ubuntu 20.04 LTS

\- \*\*Instance Type:\*\* `t2.micro` as required by the assignment

\- \*\*Networking:\*\* Existing default VPC and subnet

\- \*\*Web Server:\*\* Nginx

\- \*\*Infrastructure as Code:\*\* Terraform



\## Project Structure



```text

terraform-nginx-ubuntu/

├── main.tf

├── variables.tf

├── outputs.tf

├── terraform.tfvars

├── .gitignore

└── README.md

```



\## Resources Created



1\. \*\*AWS Security Group:\*\* Allows inbound HTTP traffic on port 80 and SSH traffic on port 22 from the configured public IP.

2\. \*\*EC2 Instance:\*\* Runs Ubuntu 20.04 LTS in the default VPC.

3\. \*\*Nginx Web Server:\*\* Installed automatically using EC2 user data.

4\. \*\*Custom HTML Page:\*\* Displays the message:



&#x20;  `Welcome to the Terraform-managed Nginx Server on Ubuntu`



Terraform also looks up the existing default VPC, default subnet, and Ubuntu AMI.



\## Prerequisites



\- An AWS account with the required EC2 and networking permissions

\- Terraform CLI

\- AWS CLI

\- Configured AWS credentials

\- Windows PowerShell or another supported terminal



\## Deployment Instructions



\### 1. Initialize Terraform



```powershell

terraform init

```



\### 2. Format the configuration



```powershell

terraform fmt

```



\### 3. Validate the configuration



```powershell

terraform validate

```



\### 4. Review the execution plan



```powershell

terraform plan -out=tfplan

```



Review the proposed changes before proceeding.



\### 5. Deploy the infrastructure



```powershell

terraform apply tfplan

```



\### 6. Retrieve the outputs



```powershell

terraform output

```



To display the website URL:



```powershell

terraform output -raw website\_url

```



Open the URL in a browser to verify the Nginx webpage.



\## Cleanup



To remove the resources managed by this Terraform configuration:



```powershell

terraform destroy

```



Review the proposed deletions and confirm when prompted.



\## Screenshots



Add screenshots showing:



1\. Successful Terraform deployment and outputs.

2\. The custom Nginx webpage accessible through the EC2 public IP.

3\. Successful Terraform destruction.



\## Learning Outcomes



\- Understanding Infrastructure as Code using Terraform

\- Configuring the AWS provider

\- Looking up existing AWS networking resources and AMIs

\- Provisioning an EC2 instance and security group

\- Automating server configuration with EC2 user data

\- Exposing Terraform outputs

- Managing infrastructure lifecycle with Terraform

## Author

Karan Kumar



