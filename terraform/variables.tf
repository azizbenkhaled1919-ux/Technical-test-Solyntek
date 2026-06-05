output "ecr_backend_url" {
  description = "URL du repository ECR pour le backend"
  value       = aws_ecr_repository.backend.repository_url
}

output "ecr_frontend_url" {
  description = "URL du repository ECR pour le frontend"
  value       = aws_ecr_repository.frontend.repository_url
}
