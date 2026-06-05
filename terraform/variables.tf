variable "aws_region" {
  description = "Région AWS"
  type        = string
  default     = "us-east-1"
}

variable "tags" {
  description = "Tags appliqués à toutes les ressources AWS"
  type        = map(string)
  default = {
    Environment = "production"
    Project     = "solyntek"
  }
}
