# 🌐 Terraform EKS Cluster Deployment

This repository contains Terraform code to deploy a complete **Amazon EKS (Elastic Kubernetes Service)** environment in AWS, using **modular architecture** with:

- ✅ VPC (private, public, intra subnets)
- ✅ EKS cluster with managed node groups
- ✅ IAM roles
- ✅ Cluster Add-ons (vpc-cni, coredns, kube-proxy)
- ✅ Custom AWS Security Group



## 📁 Folder Structure
```
.
├── main.tf           # Terraform backend and provider
├── vpc.tf            # VPC and networking resources
├── eks.tf            # EKS Cluster definition
├── iam.tf            # IAM roles and policies for worker nodes
├── variables.tf      # Input variables
├── outputs.tf        # Outputs for reference
├── security_group.tf # Custom security group for EKS access (HTTP, HTTPS, SSH)
├── README.md         # Documentation
```



## ⚙️ Requirements

- Terraform ≥ 1.3.0
- AWS CLI configured with admin permissions
- An existing AWS account with IAM permissions
- kubectl (for cluster access)
- Optional: `terraform.tfvars` file to override variables

## 🔧 Configuration

###  `security_group.tf`

This file defines a custom **AWS Security Group** attached to the EKS worker nodes. It:

- Allows **HTTP (port 80)** and **HTTPS (port 443)** from all IPs
- Allows **SSH (port 22)** from your IP address (adjustable)
- Optionally opens application-specific ports like **8080**
- Enables all **outbound traffic** via egress rule

To apply this security group, it is attached to the EKS node group via:

```hcl
security_groups = [aws_security_group.eks_custom_sg.id]
```

## 🚀 How to Deploy

```bash
# 1. Initialize Terraform
terraform init

# 2. Preview changes
terraform plan

# 3. Apply changes to deploy infrastructure
terraform apply -auto-approve

# 4. (Optional) Destroy everything
terraform destroy -auto-approve
```



## 📥 Example terraform.tfvars
```
region         = "us-east-2"
name           = "tes-dev-eks-cluster"
vpc_cidr       = "10.0.0.0/16"
azs            = ["us-east-2a", "us-east-2b"]
private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
public_subnets  = ["10.0.101.0/24", "10.0.102.0/24"]
intra_subnets   = ["10.0.5.0/24", "10.0.6.0/24"]
env             = "dev"
```


## 🔄 Outputs
After deployment, Terraform will display:

● VPC ID

● Subnet IDs

● EKS Cluster name

● EKS API endpoint

● Node group ARN and status



## 📌 Notes

- This project uses **SPOT instances** to reduce cost
- VPC and EKS modules come from the official [terraform-aws-modules](https://github.com/terraform-aws-modules)
- The IAM Role for the node group is provisioned automatically using Terraform



## ✍️ Author

Created by Omar Frikha

Feel free to contribute or open issues for improvement.