resource "aws_eks_cluster" "eks" {
  name     = var.CLUSTER_NAME
  role_arn = var.CLUSTER_ARN
  version  = "1.31"


  vpc_config {
    subnet_ids              = var.SUBNET_IDS

  }

  depends_on = [
    var.DEPENDENT_ROLES_ATTACHMENTS
  ]
  tags = {
    Name        = "${var.CLUSTER_NAME}-eks-cluster"
    Environment = var.ENVIRONMENT
  }

}




resource "aws_eks_node_group" "node_group" {
  cluster_name    = aws_eks_cluster.eks.name
  node_group_name = "${var.CLUSTER_NAME}-node-group"

  node_role_arn = var.NODE_ROLE_ARN
  subnet_ids    = var.SUBNET_IDS


  scaling_config {
    desired_size = var.DESIRED_SIZE
    max_size     = var.MAX_SIZE
    min_size     = var.MIN_SIZE
  }

  instance_types = var.INSTANCE_TYPE


  tags = {
    Name        = "${var.CLUSTER_NAME}-nodes"
    Environment = var.ENVIRONMENT
  }
  depends_on = [ var.WORKER_GROUP_POLICY , var.CONTAINER_GROUP_POLICY , var.CNI_GROUP_POLICY]
}



resource "aws_ecr_repository" "ecr_repository" {
  name                 = var.REPOSITORY_NAME
  image_tag_mutability = "MUTABLE"
  image_scanning_configuration {
    scan_on_push = var.ENABLE_SCAN_ON_PUSH
  }
}
data "aws_ecr_image" "image_tag" {
  repository_name = var.REPOSITORY_NAME
  most_recent     = true
}
