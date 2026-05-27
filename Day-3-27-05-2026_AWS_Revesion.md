# ☁️ AWS Architecture & DevOps Revision Notes

## 🧠 Key Learning Today

DevOps is not about memorizing commands.

It is about:
- understanding systems
- understanding architecture
- understanding how services connect together
- troubleshooting logically

---

# 🌍 AWS Core Services

## EC2

EC2 (Elastic Compute Cloud) is a virtual server in AWS.

Used for:
- hosting applications
- running Docker containers
- deploying websites
- cloud servers

---

## AMI

AMI (Amazon Machine Image) is a template used to create EC2 instances.

Contains:
- Operating System
- Configurations
- Preinstalled software

Examples:
- Ubuntu AMI
- Amazon Linux AMI

---

## Security Group

Security Group is a virtual firewall for EC2 instances.

Controls:
- inbound traffic
- outbound traffic

---

## Inbound vs Outbound Rules

| Rule | Meaning |
|---|---|
| Inbound | Traffic coming INTO server |
| Outbound | Traffic leaving server |

---

## SSH Connection

Connect to EC2:

```bash
ssh -i key.pem ubuntu@public-ip
```

### Components

| Part | Meaning |
|---|---|
| ssh | secure shell |
| -i | identity file |
| key.pem | private key |
| ubuntu | username |
| public-ip | EC2 public IP |

---

# 💾 S3

S3 (Simple Storage Service) is object storage in AWS.

Used for:
- file storage
- backups
- logs
- static websites

---

## Bucket vs Object

| Bucket | Object |
|---|---|
| container for files | actual file |

---

## Static Website Hosting

S3 can host:
- HTML
- CSS
- JavaScript

Cannot run backend applications.

---

# 🔐 IAM

IAM (Identity and Access Management) controls:
- users
- permissions
- roles
- policies

---

## IAM Components

| Component | Purpose |
|---|---|
| User | actual person |
| Role | temporary AWS permissions |
| Policy | permission rules |

---

## Least Privilege Principle

Give only required permissions.
Nothing extra.

---

# 🌐 VPC

VPC (Virtual Private Cloud) is a private network inside AWS.

---

## Public vs Private Subnet

| Public Subnet | Private Subnet |
|---|---|
| Internet access | No direct internet |
| Web servers | Databases |

---

## Internet Gateway

Connects VPC to internet.

---

## Route Table

Controls network traffic routing.

Example:

```text
0.0.0.0/0 → Internet Gateway
```

---

## NAT Gateway

Allows private subnet resources to access internet safely.

---

# 🔔 CloudWatch

AWS monitoring service.

Used for:
- metrics
- logs
- alarms
- dashboards

---

## Common Metrics

- CPU usage
- memory usage
- network traffic
- disk usage

---

# 📩 SNS

Simple Notification Service.

Used for:
- emails
- alerts
- notifications

---

# 🚨 Monitoring Flow

```text
CloudWatch Alarm
↓
SNS
↓
Email Notification
```

---

# 🏗️ Terraform

Infrastructure as Code (IaC) tool.

Used to automate:
- EC2
- VPC
- IAM
- networking
- cloud infrastructure

---

## Terraform Workflow

```bash
terraform init
terraform plan
terraform apply
terraform destroy
```

---

# ☸️ Kubernetes on AWS

## EKS

Elastic Kubernetes Service.

Managed Kubernetes service on AWS.

---

## ECS vs EKS

| ECS | EKS |
|---|---|
| AWS container service | Kubernetes service |
| simpler | more advanced |

---

# 🔄 CI/CD Workflow

```text
Developer pushes code
↓
GitHub Actions pipeline starts
↓
Tests run
↓
Docker image builds
↓
Application deploys
```

---

# 🚨 Troubleshooting Mindset

DevOps engineers think systematically.

Example:
Website not opening?

Check:
- Security Group
- Nginx
- Docker container
- Port mapping
- Application logs
- EC2 status

---

# 🧠 Biggest Learning

Real DevOps is:
- automation
- monitoring
- troubleshooting
- system understanding
- architecture thinking

NOT just memorizing commands.

---

# 👨‍💻 Author

Harish Vasan S  
Aspiring DevOps & Cloud Engineer
