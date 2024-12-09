module "Network" {
  source         = "./modules/Network"
  APP_NAME       = var.APP_NAME
  VPC_CIRD_BLOCK = "10.0.0.0/16"
  REGION         = var.AWS_REGION
}

module "S3" {
  source   = "./modules/Storage_S3"
  APP_NAME = var.APP_NAME

}

module "RDS" {
  source     = "./modules/Database_RDS"
  VPC_ID     = module.Network.vpc_id
  APP_NAME   = var.APP_NAME
  SUBNET_IDS = module.Network.PUBLIC_SUBNET_IDS

}

module "IAM_SECURITY" {
  source                = "./modules/Security&Permissions_IAM"
  CLUSTER_IAM_ROLE_NAME = "${var.APP_NAME}-cluster-role"
  NODE_IAM_ROLE_NAME    = "${var.APP_NAME}-node-role"
  APP_NAME              = "${var.APP_NAME}-security_group"
  VPC_ID                = module.Network.vpc_id
}


module "eks" {
  source = "./modules/Cluster_EKS"

  CLUSTER_NAME                = "${var.APP_NAME}-cluster"
  CLUSTER_ARN                 = module.IAM_SECURITY.cluster_role_arn
  NODE_ROLE_ARN               = module.IAM_SECURITY.node_role_arn
  VPC_ID                      = module.Network.vpc_id
  SUBNET_IDS                  = module.Network.PUBLIC_SUBNET_IDS
  DEPENDENT_ROLES_ATTACHMENTS = module.IAM_SECURITY.dependent_roles_attachments
  REPOSITORY_NAME             = "${var.APP_NAME}-ecr-repo"
  WORKER_GROUP_POLICY = module.IAM_SECURITY.node_AmazonEKSWorkerNodePolicy
  CONTAINER_GROUP_POLICY = module.IAM_SECURITY.node_AmazonEC2ContainerRegistryReadOnly
  CNI_GROUP_POLICY = module.IAM_SECURITY.node_AmazonEKS_CNI_Policy
}
