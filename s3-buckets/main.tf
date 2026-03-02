provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "bucket1" {
  bucket = "bookstore-infra-state-5921"
  # Allow Terraform destroy to remove the bucket even when it contains objects/versions.
  force_destroy = true

  tags = {
    Name        = "bookstore-infra-state-5921"
    Environment = "dev"
  }
}

resource "aws_s3_bucket_versioning" "bucket1_versioning" {
  bucket = aws_s3_bucket.bucket1.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket" "bucket2" {
  bucket = "bookstore-upload-bucket-6816"
  # Allow Terraform destroy to remove the bucket even when it contains objects/versions.
  force_destroy = true

  tags = {
    Name        = "bookstore-upload-bucket-6816"
    Environment = "dev"
  }
}

resource "aws_s3_bucket_versioning" "bucket2_versioning" {
  bucket = aws_s3_bucket.bucket2.id
  versioning_configuration {
    status = "Enabled"
  }
}
