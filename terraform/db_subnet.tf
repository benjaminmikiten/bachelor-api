# create db subnet group
resource "aws_db_subnet_group" "db_subnet_group" {
  name = "postgres-db-subnet-group"
  subnet_ids = aws_subnet.private_subnets.*.id

  tags = {
    Name = "${var.app_name}-db-subnet"
  }
}