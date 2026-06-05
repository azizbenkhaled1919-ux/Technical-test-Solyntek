output "cluster_name" {
  value = aws_eks_cluster.solyntek.name
}

output "cluster_endpoint" {
  value = aws_eks_cluster.solyntek.endpoint
}

output "ecr_backend_url" {
  value = aws_ecr_repository.backend.repository_url
}

output "ecr_frontend_url" {
  value = aws_ecr_repository.frontend.repository_url
}
