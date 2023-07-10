# # aws_rds_cluster
# output "db_cluster_id" {
#   description = "The ID of the cluster"
#   value       = module.db.this_rds_cluster_id
# }

# output "db_cluster_resource_id" {
#   description = "The Resource ID of the cluster"
#   value       = module.db.this_rds_cluster_resource_id
# }

output "db_endpoint" {
  description = "The cluster endpoint"
  value       = aws_rds_cluster.default.endpoint
}

output "db_reader_endpoint" {
  description = "The cluster reader endpoint"
  value       = aws_rds_cluster.default.reader_endpoint
}

output "db_database_name" {
  description = "Name for an automatically created database on cluster creation"
  value       = aws_rds_cluster.default.database_name
}

output "db_master_username" {
  description = "The master username"
  value       = aws_rds_cluster.default.master_username
}

output "db_master_password" {
  description = "The master password"
  value       = aws_rds_cluster.default.master_password
  sensitive   = true
}

output "db_port" {
  description = "The port"
  value       = aws_rds_cluster.default.port
}

output "api_gw" {
  description = "API Gateway ID for DailyVows"
  value = {
    id            = aws_apigatewayv2_api.dailyvows_api.id
    execution_arn = aws_apigatewayv2_api.dailyvows_api.execution_arn
    endpoint      = aws_apigatewayv2_api.dailyvows_api.api_endpoint
  }
}

# # aws_rds_cluster_instance
# output "db_cluster_instance_endpoints" {
#   description = "A list of all cluster instance endpoints"
#   value       = module.db.this_rds_cluster_instance_endpoints
# }

# output "db_cluster_instance_ids" {
#   description = "A list of all cluster instance ids"
#   value       = module.db.this_rds_cluster_instance_ids
# }

# # aws_security_group
# output "this_security_group_id" {
#   description = "The security group ID of the cluster"
#   value       = module.db.this_security_group_id
# }
