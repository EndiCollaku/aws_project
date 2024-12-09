terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  backend "s3" {
    bucket = "final-project-terraform-state"
    key    = "state"
    region = "eu-west-1"

  }
}

provider "aws" {
  region = var.AWS_REGION
}
