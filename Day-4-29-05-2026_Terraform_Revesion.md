# 🌍 Terraform Revision Notes for DevOps

A beginner-friendly Terraform revision guide covering Infrastructure as Code (IaC), core commands, resource creation, state management, variables, outputs, and AWS provisioning.

---

# 📖 What is Terraform?

Terraform is an **Infrastructure as Code (IaC)** tool developed by HashiCorp.

It allows engineers to provision and manage infrastructure using code instead of manually creating resources through cloud consoles.

Examples:
- AWS EC2
- AWS VPC
- S3 Buckets
- Security Groups
- IAM Roles
- Kubernetes Clusters

---

# 🚀 Terraform Workflow

```text
Write Terraform Code
        ↓
terraform init
        ↓
terraform validate
        ↓
terraform plan
        ↓
terraform apply
        ↓
Infrastructure Created
```

---

# 📂 Terraform Project Structure

```text
terraform-project/
│
├── main.tf
├── variables.tf
├── terraform.tfvars
├── outputs.tf
├── providers.tf
└── README.md
```

---

# 🔧 Terraform Core Commands

## 1. terraform init

Initializes Terraform project.

Downloads:
- Providers
- Plugins
- Modules

```bash
terraform init
```

Example:

```text
Initializing provider plugins...
Terraform has been successfully initialized!
```

---

## 2. terraform validate

Checks Terraform syntax.

```bash
terraform validate
```

Used before deployment.

---

## 3. terraform fmt

Formats Terraform code.

```bash
terraform fmt
```

Makes code clean and readable.

---

## 4. terraform plan

Shows what Terraform will create, modify, or destroy.

```bash
terraform plan
```

Example:

```text
+ create aws_instance
+ create aws_security_group
```

Nothing is actually created.

---

## 5. terraform apply

Creates infrastructure.

```bash
terraform apply
```

Example:

```text
Apply complete!
Resources: 2 added.
```

---

## 6. terraform destroy

Deletes infrastructure.

```bash
terraform destroy
```

Example:

```text
Destroy complete!
Resources: 2 destroyed.
```

---

# 📦 Providers

Providers allow Terraform to communicate with platforms.

Examples:

```text
AWS
Azure
Google Cloud
Kubernetes
Docker
```

Example:

```hcl
provider "aws" {
  region = "ap-south-1"
}
```

---

# 🏗️ Resource Block Structure

Basic syntax:

```hcl
resource "RESOURCE_TYPE" "RESOURCE_NAME" {

}
```

Example:

```hcl
resource "aws_instance" "web" {

  ami           = "ami-123456"
  instance_type = "t2.micro"

}
```

---

# 🔗 Resource References

Resources can reference each other.

Syntax:

```hcl
resource_type.resource_name.attribute
```

Example:

```hcl
aws_security_group.web_sg.id
```

---

## EC2 Referencing Security Group

Security Group:

```hcl
resource "aws_security_group" "web_sg" {

  name = "web-sg"

}
```

EC2:

```hcl
resource "aws_instance" "web" {

  ami           = "ami-123456"
  instance_type = "t2.micro"

  vpc_security_group_ids = [
    aws_security_group.web_sg.id
  ]

}
```

Terraform automatically creates dependencies.

---

# 📝 Variables

Variables make code reusable.

Example:

```hcl
variable "instance_type" {
  default = "t2.micro"
}
```

Usage:

```hcl
instance_type = var.instance_type
```

---

# 📄 terraform.tfvars

Stores variable values.

Example:

```hcl
instance_type = "t3.micro"
```

---

# 📤 Outputs

Displays useful information after deployment.

Example:

```hcl
output "public_ip" {

  value = aws_instance.web.public_ip

}
```

Output:

```text
13.233.xx.xx
```

---

# 📊 Terraform State

## terraform.tfstate

Stores the current state of infrastructure.

Contains:
- Resource IDs
- Infrastructure mapping
- Dependencies

Example:

```text
EC2 Instance ID
Security Group ID
Subnet ID
VPC ID
```

---

# ⚠️ Why You Should Never Delete terraform.tfstate

Terraform uses the state file to track infrastructure.

If deleted:

```text
Terraform forgets everything it created.
```

Possible problems:
- Infrastructure drift
- Duplicate resources
- Resource recreation

---

# 🔄 Infrastructure Drift

Occurs when infrastructure is modified manually.

Example:

```text
Terraform:
EC2 = t2.micro

Manual Change:
EC2 = t2.small
```

Terraform code and actual infrastructure are now different.

---

# 📋 terraform plan vs terraform apply

## terraform plan

Preview changes.

```bash
terraform plan
```

No resources created.

---

## terraform apply

Execute changes.

```bash
terraform apply
```

Resources are actually created.

---

# 📁 Files You Should NOT Commit to GitHub

Never commit:

```text
terraform.tfstate
terraform.tfstate.backup
terraform.tfvars
.terraform/
*.pem
```

Reason:
- Secrets
- State data
- Provider binaries

---

# 📝 Example .gitignore

```gitignore
.terraform/
*.tfstate
*.tfstate.*
terraform.tfvars
*.pem
```

---

# ☁️ AWS Resources Commonly Created with Terraform

## EC2 Instance

```hcl
resource "aws_instance" "web" {

  ami           = "ami-123456"
  instance_type = "t2.micro"

}
```

---

## Security Group

```hcl
resource "aws_security_group" "web_sg" {

  name = "web-sg"

}
```

---

## S3 Bucket

```hcl
resource "aws_s3_bucket" "bucket" {

  bucket = "my-demo-bucket"

}
```

---

## VPC

```hcl
resource "aws_vpc" "main" {

  cidr_block = "10.0.0.0/16"

}
```

---

# 🎯 Terraform Interview Questions

## What is IaC?

Infrastructure as Code.

Managing infrastructure using code instead of manual configuration.

---

## Why Terraform?

- Automation
- Version Control
- Reusable Infrastructure
- Multi-Cloud Support

---

## What is a Provider?

Plugin that allows Terraform to interact with external platforms.

Examples:
- AWS
- Azure
- GCP
- Kubernetes

---

## What is a Variable?

Input value used to make Terraform code reusable.

---

## What is an Output?

Displays information after deployment.

Example:
- Public IP
- Instance ID

---

## What is Infrastructure Drift?

Difference between actual infrastructure and Terraform code.

---

# 🚀 Commands Every DevOps Engineer Should Know

```bash
terraform init
terraform validate
terraform fmt
terraform plan
terraform apply
terraform destroy
terraform show
terraform state list
terraform output
```

---

# 🧠 Quick Revision

```text
init      → Initialize project
validate  → Check syntax
fmt       → Format code
plan      → Preview changes
apply     → Create resources
destroy   → Delete resources
state     → Track infrastructure
output    → Show values
```

---

# 👨‍💻 Author

Harish Vasan S

Aspiring DevOps Engineer  
RHCSA Certified  
AWS | Docker | Kubernetes | Terraform | Linux
