output "postgres_endpoint" {
  value = aws_db_instance.rds_instance.endpoint
}

output "alb-dns-name" {
  value = aws_alb.alb.dns_name
}

output "aws-region" {
  value = var.region
}

output "ecr-repository-url" {
  value = aws_ecr_repository.ecr_repository.repository_url
}

output "ecs-service-name" {
  value = aws_ecs_service.api-service.name
}

output "ecs-cluster-name" {
  value = aws_ecs_cluster.fp-ecs-cluster.name
}

output "ecs-task-definition-arn" {
  value = aws_ecs_task_definition.task_definition.arn
}

output "ecs-container-name" {
  value = var.app_name
}
