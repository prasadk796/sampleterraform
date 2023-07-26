# main.tf

provider "aws" {
  region = "us-east-1"  
}

resource "aws_s3_bucket" "nextjs_app_bucket" {
  bucket = "todoapp" 
  acl    = "public-read"
}

resource "aws_cloudfront_distribution" "nextjs_app_distribution" {
  origin {
    domain_name = aws_s3_bucket.nextjs_app_bucket.bucket_regional_domain_name
    origin_id   = "S3-${aws_s3_bucket.nextjs_app_bucket.id}"
  }

  
}
