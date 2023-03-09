terraform {

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.2.0"
    }
  } 
  backend "s3" {
    encrypt        = false
    bucket         = "backend-tfstate-gha"
    key            = "dev/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "tflock-tfstate-gha"
  }
}


provider "aws" {
  region  = "us-east-1"
  # profile = "ecs"
}