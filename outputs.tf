output "base_domain" {
  description = "Base domain for whole organization"
  value       = local.base_domain
}

output "github_ci_access_key" {
  description = "Access key for GitHub CI"
  sensitive = true
  value = {
    id = aws_iam_access_key.github_ci.id
    secret = aws_iam_access_key.github_ci.secret
  }
}
