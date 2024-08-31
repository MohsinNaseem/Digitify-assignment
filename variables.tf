# Input Variables

# AWS Access keys
variable "aws_access_key_id" {
  default     = ""
  type        = string
  description = "AWS Access key"
}

# AWS Secret keys
variable "aws_secret_access_key" {
  default     = ""
  type        = string
  description = "AWS Secret key"
}


# AWS Region
variable "aws_region" {
  default     = "eu-north-1"
  type        = string
  description = "AWS region where resource will be created"
}

# VPC CIDR
variable "vpc_cidr" {
  type        = string
  default     = "10.0.0.0/16"
  description = "CIDR for VPC"
}

# EKS Worker Node Instance type
variable "worker_instance_type" {
  default     = "t3.xlarge"
  type        = string
  description = "Worker node instance type"
}

# EKS cluster version
variable "eks_cluster_version" {
  default     = "1.27"
  type        = string
  description = "EKS cluster version"
}

# EKS Worker Node version
variable "eks_node_version" {
  default     = "1.27"
  type        = string
  description = "EKS Worker Node version"
}
