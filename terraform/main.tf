terraform {
  required_version = ">= 1.6.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket                      = "aziz-linda"
    key                         = "solyntek/terraform.tfstate"
    region                      = "us-east-1"
    encrypt                     = true
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    skip_region_validation      = true
  }
}

provider "aws" {
  region                      = var.aws_region
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true
}

# ─────────────────────────────────────────────
# ECR : registres privés pour stocker les images Docker
# Le cluster EKS est créé manuellement dans AWS Academy
# car STS est restreint dans cet environnement
# ─────────────────────────────────────────────
resource "aws_ecr_repository" "backend" {
  name                 = "solyntek-backend"
  image_tag_mutability = "MUTABLE"
  force_delete         = true
  tags                 = var.tags
}

resource "aws_ecr_repository" "frontend" {
  name                 = "solyntek-frontend"
  image_tag_mutability = "MUTABLE"
  force_delete         = true
  tags                 = var.tags
}
