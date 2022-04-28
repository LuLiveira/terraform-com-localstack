terraform {
  required_version = "1.1.9"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.23.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
  access_key = "123"
  secret_key = "123"
  skip_credentials_validation = true
  skip_requesting_account_id = true
  skip_metadata_api_check = true
  s3_force_path_style = true
  endpoints {
    s3 = "http://localhost:4566"
  }
}

# Create Bucket
resource "aws_s3_bucket" "my-test-bucket" {
  bucket = "my-tf-test-bucket-123123455745642342342"
  acl    = "private"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
    Managedby   = "Terraform"
  }
}