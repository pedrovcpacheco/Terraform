provider "aws" {
  region  = var.aws_region
  version = "~> 2.58"
}

terraform {
  backend "s3" {
    bucket = "project-tfstate"
    key    = "project-terraform.tfstate"
    region = "us-east-2"
  }
}
