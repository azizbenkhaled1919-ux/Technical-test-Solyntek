terraform {
  required_version = ">= 1.6.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region     = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  token      = var.aws_session_token

  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true
}

# ─────────────────────────────────────────────
# ECR : repositories pour les images Docker
# Les repositories existent déjà, Terraform les importe
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

import {
  to = aws_ecr_repository.backend
  id = "solyntek-backend"
}

import {
  to = aws_ecr_repository.frontend
  id = "solyntek-frontend"
}
