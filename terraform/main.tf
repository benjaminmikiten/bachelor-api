provider "aws" {
  region = "us-east-2"
}

// VARIABLES ===================================================================
variable "app_name" {
  type = string
}
variable "db_username" {
  description = "The username for the master DB user."
  type = string
}
variable "db_password" {
  description = "The password for the master DB user."
  type = string
  sensitive = true
}

// OUTPUTS =====================================================================

output "rds_hostname" {
  description = "RDS instance hostname"
  value       = aws_db_instance.bachelor_api_db.address
  sensitive   = true
}

output "rds_port" {
  description = "RDS instance port"
  value       = aws_db_instance.bachelor_api_db.port
}

output "rds_endpoint" {
  description = "RDS instance endpoint"
  value       = aws_db_instance.bachelor_api_db.endpoint
  sensitive   = true
}

output "ecr_repo_url" {
  description = "ECR repository URL"
  value       = aws_ecr_repository.ecr_repository.repository_url
}

// ROUTE 53 ====================================================================

# resource "aws_route53_record" "bachelor-api" {
#   zone_id = "Z0049733JHKHBPCH1T9P"
#   name    = "bachelor-api.wizardhut.xyz"
#   type    = "CNAME"
#   ttl     = 300
# }


// AZs =========================================================================
data "aws_availability_zones" "available" {}


// ECR =========================================================================
resource "aws_ecr_repository" "ecr_repository" {
  name                 = var.app_name
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}

// VPC =========================================================================
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "2.77.0"

  name                 = "vpc-${var.app_name}"
  cidr                 = "10.0.0.0/16"
  azs                  = data.aws_availability_zones.available.names
  public_subnets       = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
  enable_dns_hostnames = true
  enable_dns_support   = true
}

// Subnets
resource "aws_db_subnet_group" "db_subnet_group" {
  name       = var.app_name
  subnet_ids = module.vpc.public_subnets

  tags = {
    Name = var.app_name
  }
}

// Security Groups =============================================================

// for the DB
resource "aws_security_group" "rds_security_group" {
  name   = "rds-${var.app_name}"
  vpc_id = module.vpc.vpc_id

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.app_name
  }
}

resource "aws_security_group" "alb_security_group" {
  name   = "alb-${var.app_name}"
  vpc_id = module.vpc.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}



// RDS =========================================================================

resource "aws_db_instance" "bachelor_api_db" {
  identifier             = var.app_name
  instance_class         = "db.t3.micro"
  allocated_storage      = 5
  engine                 = "mysql"
  engine_version         = "8.0"
  username               = var.db_username
  password               = var.db_password
  db_subnet_group_name   = aws_db_subnet_group.db_subnet_group.name
  vpc_security_group_ids = [aws_security_group.rds_security_group.id]
  publicly_accessible    = true
  skip_final_snapshot    = true
}