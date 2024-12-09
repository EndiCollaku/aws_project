output "db_instance_endpoint" {
  value = aws_db_instance.postgres.address
}

output "DB_NAME" {
  value = aws_db_instance.postgres.db_name
}

output "USERNAME" {
  value = aws_db_instance.postgres.username
}

output "PASSWORD" {
  value = aws_db_instance.postgres.password
  sensitive = true
}

