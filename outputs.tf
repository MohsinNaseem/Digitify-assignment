output "vpc-id" {
  value = aws_vpc.mohsin-vpc-1.id
}

output "enable_dns_hostnames" {
  value = aws_vpc.mohsin-vpc-1.enable_dns_hostnames
}

// EKS Outputs

output "cluster_name" {
  description = "Name of EKS control plane"
  value       = aws_eks_cluster.mohsin-eks-cluster.id
}

output "cluster_endpoint" {
  description = "Endpoint for EKS control plane"
  value       = aws_eks_cluster.mohsin-eks-cluster.endpoint
}

output "cluster_clusterid" {
  description = "Cluster ID for EKS control plane"
  value       = aws_eks_cluster.mohsin-eks-cluster.cluster_id
}

output "cluster_arn" {
  description = "ARN for EKS control plane"
  value       = aws_eks_cluster.mohsin-eks-cluster.arn
}

output "cluster_version" {
  description = "Version for EKS control plane"
  value       = aws_eks_cluster.mohsin-eks-cluster.platform_version
}

output "cluster_status" {
  description = "Status for EKS control plane"
  value       = aws_eks_cluster.mohsin-eks-cluster.status
}

output "cluster_vpc-config" {
  description = "VPC config for EKS control plane"
  value       = aws_eks_cluster.mohsin-eks-cluster.vpc_config
}





