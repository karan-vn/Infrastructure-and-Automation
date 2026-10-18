# EC2 Nginx Deployment with Terraform



## Project Overview



This project demonstrates Infrastructure as Code (IaC) using Terraform to deploy an Nginx web server on an AWS EC2 instance running Ubuntu 20.04 LTS.



The instance is configured automatically using EC2 user data, which installs Nginx and replaces the default index page with a custom HTML message.



## Architecture



- \*\*Cloud Provider:\*\* AWS

- \*\*Region:\*\* Asia Pacific (Mumbai) — `ap-south-1`

- \*\*Operating System:\*\* Ubuntu 20.04 LTS

- \*\*Instance Type:\*\* `t2.micro` as required by the assignment

- \*\*Networking:\*\* Existing default VPC and subnet

- \*\*Web Server:\*\* Nginx

- \*\*Infrastructure as Code:\*\* Terraform



## Project Structure



```text

terraform-nginx-ubuntu/

├── main.tf

├── variables.tf

├── outputs.tf

├── terraform.tfvars

├── .gitignore

└── README.md

```



## Resources Created



1\. \*\*AWS Security Group:\*\* Allows inbound HTTP traffic on port 80 and SSH traffic on port 22 from the configured public IP.

2\. \*\*EC2 Instance:\*\* Runs Ubuntu 20.04 LTS in the default VPC.

3\. \*\*Nginx Web Server:\*\* Installed automatically using EC2 user data.

4\. \*\*Custom HTML Page:\*\* Displays the message:



&#x20;  `Welcome to the Terraform-managed Nginx Server on Ubuntu`



Terraform also looks up the existing default VPC, default subnet, and Ubuntu AMI.



## Prerequisites



\- An AWS account with the required EC2 and networking permissions

\- Terraform CLI

\- AWS CLI

\- Configured AWS credentials

\- Windows PowerShell or another supported terminal



\## Deployment Instructions



### 1. Initialize Terraform



```powershell

terraform init

```



### 2. Format the configuration



```powershell

terraform fmt

```



### 3. Validate the configuration



```powershell

terraform validate

```



### 4. Review the execution plan



```powershell

terraform plan -out=tfplan

```



Review the proposed changes before proceeding.



### 5. Deploy the infrastructure



```powershell

terraform apply tfplan

```



### 6. Retrieve the outputs



```powershell

terraform output

```



To display the website URL:



```powershell

terraform output -raw website\_url

```



Open the URL in a browser to verify the Nginx webpage.



## Cleanup



To remove the resources managed by this Terraform configuration:



```powershell

terraform destroy

```



Review the proposed deletions and confirm when prompted.



## Screenshots

1\. Successful Terraform deployment and outputs.
<img width="959" height="379" alt="Screenshot 2026-10-18 111837" src="https://github.com/user-attachments/assets/a1748a97-532c-4b0e-9c01-8b0ff3c9a8a0" />
<img width="959" height="186" alt="Screenshot 2026-10-18 111945" src="https://github.com/user-attachments/assets/c8da4e88-9563-4a36-bde8-a8f2938dd901" />


2\. The custom Nginx webpage accessible through the EC2 public IP.

<img width="959" height="535" alt="Screenshot 2026-10-18 110410" src="https://github.com/user-attachments/assets/2f7c2ed6-c62d-47dc-b5aa-4fb4885e75d6" />


3\. Successful Terraform destruction.

<img width="913" height="436" alt="image" src="https://github.com/user-attachments/assets/6c88a63e-d1f5-44c0-ad86-4487682e1482" />

<img width="704" height="311" alt="Screenshot 2026-10-18 112315" src="https://github.com/user-attachments/assets/381dd8c9-e7ee-4540-b9fc-1d901b267a7a" />



## Learning Outcomes



\- Understanding Infrastructure as Code using Terraform

\- Configuring the AWS provider

\- Looking up existing AWS networking resources and AMIs

\- Provisioning an EC2 instance and security group

\- Automating server configuration with EC2 user data

\- Exposing Terraform outputs

\- Managing infrastructure lifecycle with Terraform

## Author

Karan Kumar



