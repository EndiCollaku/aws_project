output "ECR_REPO_NAME" {
  value = module.eks.REPOSITORY_NAME
}

output "ECR_URL" {
  value = module.eks.ecr_repository_url
}

output "FULL_ECR" {
  value = module.eks.ECR_FULL_IMAGE_URI
  
}

output "DATABASE_USER" {
  value = module.RDS.USERNAME
}

output "DATABASE_PASSWORD" {
  value = module.RDS.PASSWORD
  sensitive = true
}
output "DATABASE_NAME" {
  value = module.RDS.DB_NAME
}

output "DATABASE_HOST" {
  value = module.RDS.db_instance_endpoint

}

output "S3_BUCKET_NAME" {
  value = module.S3.S3_BUCKET_NAME
}

output "EKS_CLUSTER_NAME" {
  value = module.eks.CLUSTER_NAME
}

