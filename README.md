# iac-cd-remotely-monitor-the-vitals
This mobile application is aimed at providing healthcare professionals a platform to remotely monitor the vitals of their patients and provide consultation accordingly.

## Step 1: Infrastructure Setup with Terraform

To set up the infrastructure for the healthcare mobile application, we will be using Terraform, an Infrastructure-as-Code (IaC) tool.

### Install Terraform

Start by installing Terraform on your local machine. You can download the appropriate version for your operating system from the [official Terraform website](https://www.terraform.io/downloads.html).

### Create Project Directory

Create a directory for your project and navigate to it using the command line.

### Directory Structure

Organize your project with the following directory structure:
```
project/
├── modules/
│ ├── vpc/
│ ├── subnet/
│ ├── s3/
│ ├── ec2/
│ └── rds/
├── main.tf
├── variables.tf
├── outputs.tf
└── terraform.tfvars
```

### Modularize Resources

Create separate modules for each resource to promote modularity and reusability. In the `modules` directory, create modules for VPC, subnet, S3, EC2, and RDS.

### Define Main Configuration


### Define Variables
In the variables.tf file, define the variables used in your Terraform configuration. Variables allow you to provide inputs at runtime, making your code more flexible. Define variables for VPC CIDR block, subnet CIDR block, availability zone, bucket name, instance count, AMI, instance type, database identifier, allocated storage, database engine, instance class, username, and password.


### Define Outputs: 
In the outputs.tf file, define the outputs that provide valuable information about the created resources. These outputs can be used in subsequent steps or for reference purposes.

### Define Variable Values:
In the terraform.tfvars file, provide the values for the variables defined earlier. Adjust the values based on your requirements.

### Initialize and Apply:
Run terraform init to initialize the Terraform project. Then, run terraform plan to preview the changes that Terraform will apply. Finally, run terraform apply to create the infrastructure on AWS.

### Review Outputs:
After the apply command completes, review the outputs displayed. These will provide you with important information such as VPC ID, subnet ID, S3 bucket name, EC2 instance IDs, and RDS endpoint.
  

