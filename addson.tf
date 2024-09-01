resource "aws_eks_addon" "coredns" {
  cluster_name = aws_eks_cluster.mohsin-eks-cluster.name
  addon_name   = "coredns"
  addon_version               = "v1.9.3-eksbuild.10"
  resolve_conflicts_on_create = "OVERWRITE"
  resolve_conflicts_on_update = "OVERWRITE"
}

resource "aws_eks_addon" "vpc-cni" {
  cluster_name = aws_eks_cluster.mohsin-eks-cluster.name
  addon_name   = "vpc-cni"
  addon_version               = "v1.17.1-eksbuild.1"
  resolve_conflicts_on_create = "OVERWRITE"
  resolve_conflicts_on_update = "OVERWRITE"
}

resource "aws_eks_addon" "kube-proxy" {
  cluster_name = aws_eks_cluster.mohsin-eks-cluster.name
  addon_name   = "kube-proxy"
  addon_version               = "v1.26.11-eksbuild.4"
  resolve_conflicts_on_create = "OVERWRITE"
  resolve_conflicts_on_update = "OVERWRITE"
}

resource "aws_eks_addon" "ebs-csi-driver" {
  cluster_name = aws_eks_cluster.mohsin-eks-cluster.name
  addon_name   = "aws-ebs-csi-driver"
  addon_version               = "v1.28.0-eksbuild.1"
  resolve_conflicts_on_create = "OVERWRITE"
  resolve_conflicts_on_update = "OVERWRITE"
}