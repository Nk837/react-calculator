terraform {
  backend "s3" {
    bucket         = "terraform-state-bucket"
    key            = "terraform/github-actions/terraform.tfstate"
    region         = "ap-south-1"
    encrypt        = true
  }
}
