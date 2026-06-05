variable "aws_region" {
  description = "Région AWS"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Nom du projet (utilisé pour nommer toutes les ressources)"
  type        = string
  default     = "solyntek"
}

variable "node_instance_type" {
  description = "Type d'instance EC2 pour les nodes EKS"
  type        = string
  default     = "t3.medium"
  # t3.medium minimum recommandé pour EKS (t3.micro est trop petit)
}

variable "tags" {
  description = "Tags appliqués à toutes les ressources AWS"
  type        = map(string)
  default = {
    Environment = "production"
    Project     = "solyntek"
  }
}
