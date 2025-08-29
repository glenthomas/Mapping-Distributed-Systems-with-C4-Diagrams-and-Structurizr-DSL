terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6"
    }
  }
  backend "s3" {
    bucket         = "glen-thomas-terraform-state"
    key            = "structurizr-sample-site/terraform.tfstate"
    region         = "eu-west-1"
    dynamodb_table = "glen-thomas-terraform-lock"
    encrypt        = true
  }
}

provider "aws" {
  region = "eu-west-1"
}

# AWS provider for ACM certificate (must be in us-east-1 for CloudFront)
provider "aws" {
  alias  = "us_east_1"
  region = "us-east-1"
}
