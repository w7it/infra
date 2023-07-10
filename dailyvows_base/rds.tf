resource "random_password" "database" {
  length  = 32
  special = false
}

resource "aws_rds_cluster" "default" {
  cluster_identifier = local.appname

  engine         = "aurora-postgresql"
  engine_mode    = "provisioned"
  engine_version = "14.6"

  database_name   = local.appname
  master_username = local.appname
  master_password = random_password.database.result

  vpc_security_group_ids = [
    aws_security_group.rds.id
  ]

  serverlessv2_scaling_configuration {
    max_capacity = 2.0
    min_capacity = 0.5
  }
}

resource "aws_rds_cluster_instance" "default" {
  identifier         = "${aws_rds_cluster.default.cluster_identifier}-serverless"
  cluster_identifier = aws_rds_cluster.default.id
  instance_class     = "db.serverless"
  engine             = aws_rds_cluster.default.engine
  engine_version     = aws_rds_cluster.default.engine_version

  publicly_accessible = true
}
