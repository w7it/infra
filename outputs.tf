output "base_domain" {
  description = "Base domain for whole organization"
  value       = local.base_domain
}

output "db_endpoint" {
  description = "The cluster endpoint"
  value       = aws_db_instance.main.endpoint
}

output "db_database_name" {
  description = "Name of database"
  value       = aws_db_instance.main.db_name
}

output "db_master_username" {
  description = "The master username"
  value       = aws_db_instance.main.username
}

output "db_master_password" {
  description = "The master password"
  value       = aws_db_instance.main.password
  sensitive   = true
}

output "db_port" {
  description = "The port"
  value       = aws_db_instance.main.port
}

output "github_ci_access_key" {
  description = "Access key for GitHub CI"
  sensitive = true
  value = {
    id = aws_iam_access_key.github_ci.id
    secret = aws_iam_access_key.github_ci.secret
  }
}
