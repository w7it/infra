resource "random_password" "database" {
  length  = 32
  special = false
}

resource "aws_db_instance" "main" {
  identifier     = "w7it-main"
  instance_class = "db.t3.micro"
  engine         = "postgres"
  engine_version = "14.6"

  db_name  = "w7it"
  username = "w7it"
  password = random_password.database.result

  allocated_storage   = 10
  publicly_accessible = true
  multi_az            = false

  vpc_security_group_ids = [
    aws_security_group.rds.id
  ]
}
