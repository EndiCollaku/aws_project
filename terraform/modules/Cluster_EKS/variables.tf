variable "CLUSTER_NAME" {
  type = string
}

variable "CLUSTER_ARN" {
  type = string
}
variable "VPC_ID" {
  type = string
}

variable "SUBNET_IDS" {
  type = list(string)

}
variable "INSTANCE_TYPE" {
  type    = list(string)
  default = ["t3.medium"]
}
variable "AMI_ID" {
  type    = string
  default = "ami-02141377eee7defb9"
}
variable "DEPENDENT_ROLES_ATTACHMENTS" {

}

variable "ENVIRONMENT" {
  type    = string
  default = "dev"

}
variable "NODE_ROLE_ARN" {
  type = string
}

variable "DESIRED_SIZE" {
  type    = number
  default = 2
}

variable "MAX_SIZE" {
  type    = number
  default = 4
}
variable "MIN_SIZE" {
  type    = number
  default = 1
}

variable "REPOSITORY_NAME" {
  type = string
}

variable "ENABLE_SCAN_ON_PUSH" {
  type    = bool
  default = true
}

variable "WORKER_GROUP_POLICY" {

}

variable "CNI_GROUP_POLICY" {
  
}

variable "CONTAINER_GROUP_POLICY" {
  
}