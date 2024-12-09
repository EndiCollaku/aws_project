output "eks_cluster_arn" {
  description = "ARN of the EKS Cluster"
  value       = aws_eks_cluster.eks.arn
}

output "eks_cluster_endpoint" {
  description = "Endpoint of the EKS Cluster"
  value       = aws_eks_cluster.eks.endpoint
}

output "eks_node_group_name" {
  description = "Name of the EKS Node Group"
  value       = aws_eks_node_group.node_group.node_group_name
}

output "ecr_repository_url" {
 value = substr(aws_ecr_repository.ecr_repository.repository_url, 0, length(aws_ecr_repository.ecr_repository.repository_url) - length("/${var.REPOSITORY_NAME}"))
}

output "REPOSITORY_NAME" {
  value = aws_ecr_repository.ecr_repository.name
}

output "ECR_FULL_IMAGE_URI" {
  value = "${aws_ecr_repository.ecr_repository.repository_url}:${data.aws_ecr_image.image_tag.image_tags[0]}"
}

output "CLUSTER_NAME" {
  value = aws_eks_cluster.eks.name
}

