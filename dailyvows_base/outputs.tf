output "db_endpoint" {
  description = "The cluster endpoint"
  value       = data.terraform_remote_state.main.outputs.db_endpoint
}

output "db_database_name" {
  description = "Name of database"
  value       = data.terraform_remote_state.main.outputs.db_database_name
}

output "db_master_username" {
  description = "The master username"
  value       = data.terraform_remote_state.main.outputs.db_master_username
}

output "db_master_password" {
  description = "The master password"
  value       = data.terraform_remote_state.main.outputs.db_master_password
  sensitive   = true
}

output "db_port" {
  description = "The port"
  value       = data.terraform_remote_state.main.outputs.db_port
}

output "api_gw" {
  description = "API Gateway ID for DailyVows"
  value = {
    id               = aws_apigatewayv2_api.dailyvows_api.id
    execution_arn    = aws_apigatewayv2_api.dailyvows_api.execution_arn
    endpoint         = aws_apigatewayv2_api.dailyvows_api.api_endpoint
    custom_domain_id = aws_apigatewayv2_domain_name.dailyvows_api.id
  }
}
