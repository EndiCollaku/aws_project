variable "APP_NAME" {
  type = string
}

variable "SUBNET_IDS" {
  type = list(string)
}

variable "VPC_ID" {
  type = string
}

# Variables
variable "DB_NAME" {
  default = "mydatabase"
}

variable "DB_USERNAME" {
  default = "postgres"
}

variable "DB_PASSWORD" {
  default = "postgres"
}

variable "DB_INSTANCE_CLASS" {
  default = "db.t3.micro"
}

variable "DB_ALLOCATED_STORAGE" {
  default = 20
}