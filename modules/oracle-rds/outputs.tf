output "db_endpoint" {
  value = aws_db_instance.this.endpoint
}

output "db_identifier" {
  value = aws_db_instance.this.id
}

output "db_parameter_group" {
  value = aws_db_parameter_group.this.name
}

output "db_option_group" {
  value = aws_db_option_group.this.name
}
