resource "aws_instance" "kubectl-server" {
  ami                         = "ami-0416c18e75bd69567"
  key_name                    = "kubectl-keypair"
  instance_type               = "t3.micro"
  associate_public_ip_address = true
  subnet_id                   = aws_subnet.public-eu-north-1a.id
  vpc_security_group_ids      = [aws_security_group.kubectl-server-sg.id]

  tags = {
    Name = "kubectl-server"
  }
}

resource "aws_eks_node_group" "worker-nodes" {
  cluster_name    = aws_eks_cluster.mohsin-eks-cluster.name
  node_group_name = "worker-nodes"
  node_role_arn   = aws_iam_role.eksWorkerRole.arn

  subnet_ids = [
    aws_subnet.private-eu-north-1a.id,
    aws_subnet.private-eu-north-1b.id
  ]

  capacity_type  = "ON_DEMAND"
  instance_types = [var.worker_instance_type]
  disk_size      = 60
  version = var.eks_node_version

  remote_access {
    ec2_ssh_key  = "worker-keypair"
  }

  scaling_config {
    desired_size = 1
    max_size     = 1
    min_size     = 1
  }
  lifecycle {
    create_before_destroy = true
    ignore_changes        = [scaling_config[0].desired_size]
  }

  update_config {
    max_unavailable = 1
  }

  labels = {
    role = "general"
  }
  
  tags = {
    app                                                                = "digitify-apps"
    env                                                                = "production"
  }

  depends_on = [
    aws_iam_role_policy_attachment.AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.AmazonEC2ContainerRegistryReadOnly,
  ]
}