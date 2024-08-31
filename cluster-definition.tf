resource "aws_eks_cluster" "mohsin-eks-cluster" {
  name     = "mohsin-eks-cluster"
  role_arn = aws_iam_role.eksClusterRole.arn
  version  = "1.27"

  vpc_config {
    subnet_ids = [
      aws_subnet.private-eu-north-1a.id,
      aws_subnet.private-eu-north-1b.id,
      aws_subnet.public-eu-north-1a.id,
      aws_subnet.public-eu-north-1b.id
    ]
	endpoint_private_access = true
    endpoint_public_access  = false
  }

  tags = {
    Name        = "mohsin-eks-cluster"
    Environment = "Production"
  }

  depends_on = [
    aws_iam_role_policy_attachment.AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.AmazonEKSServicePolicy,
    aws_iam_role_policy_attachment.AmazonEKSVPCResourceController,
    aws_iam_role_policy_attachment.AmazonEKSVPCResourceController,
  ]
}