# iac-cd-remotely-monitor-the-vitals
This mobile application is aimed at providing healthcare professionals a platform to remotely monitor the vitals of their patients and provide consultation accordingly.

assumes that the application is a Java application built with Maven, and it's Dockerized


I would recommend the following folder structure for the project:

```
project/
├── infrastructure/
│   ├── terraform/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   ├── outputs.tf
│   │   └── ...
│   └── ansible/
│       ├── playbooks/
│       │   ├── installation.yml
│       │   ├── configuration.yml
│       │   └── ...
│       └── inventories/
│           ├── production
│           └── staging
├── application/
│   ├── src/
│   │   ├── app_code
│   │   └── ...
│   ├── Dockerfile
│   └── ...
├── pipeline/
│   ├── Jenkinsfile
│   └── ...
├── monitoring/
│   ├── scripts/
│   │   ├── cloudwatch_metrics.py
│   │   └── ...
│   ├── alerts/
│   │   ├── cpu_usage.yaml
│   │   └── ...
│   ├── dashboards/
│   │   ├── app_performance.json
│   │   └── ...
│   └── ...
└── documentation/
    ├── architecture.md
    ├── setup_steps.md
    ├── security.md
    └── ...

```

## Step 1: Infrastructure Setup with Terraform

To set up the infrastructure for the healthcare mobile application, we will be using Terraform, an Infrastructure-as-Code (IaC) tool.

### Install Terraform

Start by installing Terraform on your local machine. You can download the appropriate version for your operating system from the [official Terraform website](https://www.terraform.io/downloads.html).

### Create Project Directory

Create a directory for your project and navigate to it using the command line.

### Directory Structure

Organize your project with the following directory structure:
```
terraform/
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

In the main.tf file, define the main configuration that calls the individual modules and sets up the necessary resources. It includes:

Calling the VPC module and passing necessary variables.
Calling the Subnet module and passing necessary variables.
Calling the S3 module and passing necessary variables.
Calling the EC2 module and passing necessary variables.
Calling the RDS module and passing necessary variables.
Defining additional resources like security groups.

### Define Variables
In the variables.tf file, define the variables used in your Terraform configuration. Variables allow you to provide inputs at runtime, making your code more flexible. Define variables for VPC CIDR block, subnet CIDR block, availability zone, bucket name, instance count, AMI, instance type, database identifier, allocated storage, database engine, instance class, username, and password.


### Define Outputs: 
In the outputs.tf file, define the outputs that provide valuable information about the created resources. These outputs can be used in subsequent steps or for reference purposes.

### Define Variable Values:
In the terraform.tfvars file, provide the values for the variables defined earlier. Adjust the values based on your requirements.

### Initialize and Apply:
Run terraform init to initialize the Terraform project. Then, run terraform plan to preview the changes that Terraform will apply. Finally, run terraform apply to create the infrastructure on AWS.

```
terraform init
terraform plan
terraform apply
```

### Review Outputs:
After the apply command completes, review the outputs displayed. These will provide you with important information such as VPC ID, subnet ID, S3 bucket name, EC2 instance IDs, and RDS endpoint.

## Step 2: Configuration Management: Set up Ansible for the configuration management of the cloud servers

### Ensure Ansible is installed on your local machine or a control node.

### Create an Ansible Inventory file:

This file will contain the IP addresses of your EC2 instances that you're managing with Ansible.

Create a file called 'inventory.ini' in your main directory (alongside the Terraform files) and insert your EC2 instance IP addresses

### create an Ansible playbook that will handle the software installation and configuration on the EC2 instances.

Create a file named playbook.yml in your main directory

###  Define the variables used in the playbook.

Create a folder named vars in the same directory as your playbook.yml and within it, create a file named main.yml. In this file, you will define the variables used in the playbook

### run the Ansible playbook using the following command:

```
ansible-playbook -i inventory playbook.yml

```

tasks include updating and upgrading the apt packages, installing necessary software, cloning your application repository, building Docker images, and starting your application with Docker Compose.

### Ensure that the playbook executes correctly

To do this, you can add a task at the end of the playbook that sends a request to the application and checks the response. Here's an example task you can add:

```
- name: application status
  uri:
    url: "http://{{ ansible_host }}:8080"
    method: GET
    status_code: 200
```

### automatically run the Ansible playbook every time Terraform provisions new infrastructure.

add a null_resource in your main.tf file that triggers the Ansible playbook:
```
resource "null_resource" "ansible_provisioner" {
  triggers = {
    instance_ids = join(",", module.ec2.instance_ids)
  }

  provisioner "local-exec" {
    command = "ansible-playbook -i ${join(",", module.ec2.instance_ids)} playbook.yml"
  }
}
```


