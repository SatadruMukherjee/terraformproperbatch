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
    region = "us-east-1"
  }
  required_version = "~> 1.0"
}


provider "aws" {
  region     = "us-east-1"
}