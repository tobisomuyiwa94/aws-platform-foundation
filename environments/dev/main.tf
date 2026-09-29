terraform {
  required_version = ">= 1.16.0"

  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source   = "../../modules/vpc"
  vpc_cidr = var.vpc_cidr
}
module "iam" {
  source     = "../../modules/iam"
  bucket_arn = module.storage.bucket_arn
}
module "storage" {
  source = "../../modules/storage"
}

module "security" {
  source    = "../../modules/security"
  bucket_id = module.storage.bucket_name
}