resource "aws_ecs_service" "api-service" {
  name = "bachelor-api-service"
  cluster = aws_ecs_cluster.fp-ecs-cluster.id
  task_definition = aws_ecs_task_definition.task_definition.arn
  desired_count = 2
  launch_type = "FARGATE"


  network_configuration {
    security_groups = [
      aws_security_group.ecs_sg.id]
    subnets = aws_subnet.public_subnets.*.id
    assign_public_ip = true
  }

  load_balancer {
    container_name = "bachelor-api"
    container_port = var.app_port
    target_group_arn = aws_alb_target_group.target_group.id
  }

  depends_on = [
    aws_alb_listener.fp-alb-listener
  ]
}