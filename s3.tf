provider "aws" {
  region     = "ap-south-1"
}


resource "aws_s3_bucket" "test" {
  bucket = "terraform-with-github-actions"

  tags = {
    Name        = "terraform-with-github-actions"
    Environment = "test"
  }
}

resource "aws_s3_bucket_website_configuration" "test" {
  bucket = aws_s3_bucket.test.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }

  routing_rule {
    condition {
      key_prefix_equals = "docs/"
    }
    redirect {
      replace_key_prefix_with = "documents/"
    }
  }
}


output "website_url" {
  value = aws_s3_bucket_website_configuration.test.website_endpoint
}