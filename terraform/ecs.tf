# create the ECS cluster
resource "aws_ecs_cluster" "fp-ecs-cluster" {
  name = "${var.app_name}-ecs"

  tags = {
    Name = "${var.app_name}-ecs"
  }
}