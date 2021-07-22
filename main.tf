provider "aws" {
  region = "us-east-2"
}

terraform {
  backend "s3" {
    bucket         = "tm-interviews-tf-state"
    # ------------------------------------------
    # Make sure to change the key per-candidate!
    # ------------------------------------------
    key            = "candidate1/terraform.tfstate"
    region         = "us-east-2"
    dynamodb_table = "lock"
    encrypt        = "true"
  }
}

locals {
  name = "make_it_ha"
  kubernetes_version = "1.20"
  # ------------------------------------------
  # Make sure to change the key per-candidate!
  # ------------------------------------------
  identifier = 1
}

data "terraform_remote_state" "base" {
  backend = "s3"
  config = {
    bucket         = "tm-interviews-tf-state"
    key            = "base/terraform.tfstate"
    region         = "us-east-2"
  }
}

data "aws_caller_identity" "current" {}
