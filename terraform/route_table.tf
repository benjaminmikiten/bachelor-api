locals {
  subnets = flatten([aws_subnet.public_subnets.*.id])
}

resource "aws_route_table" "rt_public" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = var.rt_wide_route
    gateway_id = aws_internet_gateway.internet_gateway.id
  }

  tags = {
    Name = "${var.app_name}-rt-public"
  }
}

resource "aws_default_route_table" "rt_private_default" {
  default_route_table_id = aws_vpc.vpc.default_route_table_id

  tags = {
    Name = "${var.app_name}-rt-private-default"
  }
}