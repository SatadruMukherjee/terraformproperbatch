terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
  backend "s3" {
    bucket = "demoyttesttrail"
    key    = "test123/terraform/terraform.tfstate"
  }
  required_version = "~> 1.0"
}


provider "aws" {
  region     = var.AWS_DEFAULT_REGION
}