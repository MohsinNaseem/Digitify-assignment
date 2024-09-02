## Infrastructure Components

### EKS Cluster
- **Version:** 1.27
- **Node Group Version:** 1.27
- **Node Types:** Configurable via variables
- **Add-ons:**
  - CoreDNS
  - VPC CNI
  - Kube Proxy
  - EBS CSI Driver

### Networking
- **VPC:** Configurable VPC with public and private subnets
- **Subnets:** Public and private subnets for EKS

### IAM Roles
- **EKS Roles:** IAM roles for EKS control plane and node groups
- **ECR Roles:** IAM roles for ECR access
- **Additional Roles:** S3, DynamoDB, and others as required

### Terraform State Management
- **Backend:** S3 Bucket for storing Terraform state
- **State Locking:** DynamoDB table for state locking

## Terraform Variables

The `variables.tf` file contains the following key variables:

- `eks_cluster_version`: EKS Cluster version (default: `1.27`)
- `eks_node_group_version`: EKS Node Group version (default: `1.27`)
- `eks_node_type`: EC2 instance type for EKS node group
- `vpc_cidr`: CIDR block for the VPC
- `public_subnets`: List of public subnet CIDRs
- `private_subnets`: List of private subnet CIDRs
- `region`: AWS region

## GitHub Workflows

### Terraform Plan and Apply Workflow
- **Trigger:** 
  - Push to `main` branch
  - Manual trigger via GitHub Actions
- **Environment Selection:** Users can select the environment (e.g., `dev`, `staging`, `production`) from a dropdown in the workflow.
- **Approval:** If `production` environment is selected, manual approval is required before applying the changes.

### Terraform Destroy Workflow
- **Trigger:** Manual trigger via GitHub Actions.
- **Environment Selection:** Users can select the environment (e.g., `dev`, `staging`, `production`) from a dropdown in the workflow.
- **Purpose:** Destroy the infrastructure for the selected environment.

### Reusable Workflows
Reusable workflows are stored in a separate repository and referenced in the GitHub Actions workflows in this project.

## Getting Started

1. **Clone the Repository:**
   ```bash
   git clone https://github.com/MohsinNaseem/digitify-terraform.git
   cd digitify-terraform