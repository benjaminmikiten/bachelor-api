data "template_file" "task_definition_template" {
  template = file("task_definition.json.tpl")
  vars = {
    APP_NAME = var.app_name
    APP_PORT = var.app_port
    REPOSITORY_URL = aws_ecr_repository.ecr_repository.repository_url
    POSTGRES_USERNAME = aws_db_instance.rds_instance.username
    POSTGRES_PASSWORD = aws_db_instance.rds_instance.password
    POSTGRES_ENDPOINT = aws_db_instance.rds_instance.endpoint
    POSTGRES_DATABASE = aws_db_instance.rds_instance.db_name
  }
}