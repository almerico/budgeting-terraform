resource "aws_s3_bucket" "terraform_state" {
  bucket = "${var.env}-terraform-tfstate"

  tags = {
    "info:Terraform" = "True"
  }
  versioning {
    enabled = true
  }

}

resource "aws_s3_bucket_public_access_block" "terraform_state" {
  bucket = aws_s3_bucket.terraform_state.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }

  backend "s3" {
    bucket = "structura-terraform-tfstate"
    key    = "tfstate-backend/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
}
