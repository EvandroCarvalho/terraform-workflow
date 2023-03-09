terraform {

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.2.0"
    }
  }
}

backend "s3" {}


provider "aws" {
  region  = "us-east-1"
  profile = "ecs"
}