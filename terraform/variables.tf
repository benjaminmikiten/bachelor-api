variable "app_name" {
  description = "The name of the application"
  type = string
}

variable "cname_record_name" {
  description = "The name of the CNAME record"
  type = string
}

variable "zone_id" {
  description = "The zone id of the domain"
  type = string
}

variable "infrastructure_version" {
  default = "1"
}

variable "region" {
  default = "us-east-2"
}
variable "vpc_cidr" {
  description = "The CIDR Block for the VPC"
  default     = "10.0.0.0/16"
}

variable "rt_wide_route" {
  description = "Route in the route table"
  default     = "0.0.0.0/0"
}
variable "subnet_count" {
  description = "number of subnets"
  default = 2
}
variable "availability_zones" {
  description = "availability zone to create subnet"
  default = [
    "us-east-2a",
    "us-east-2b"]
}
variable "postgres_db_port" {
  description = "Port exposed by the RDS instance"
  default = 5432
}
variable "rds_instance_type" {
  description = "Instance type for the RDS database"
  default = "db.t3.micro"
}
variable "rds_identifier" {
  description = "db identifier"
  default     = "postgres"
}
variable "rds_storage_type" {
  description = "db storage type"
  default     = "gp2"
}

variable "rds_allocated_storage" {
  description = "db allocated storage"
  default     = 5
}
variable "rds_engine" {
  description = "type of db engine"
  default     = "postgres"
}
variable "rds_engine_version" {
  description = "db engine version"
  default     = "12"
}
variable "rds_database_name" {
  description = "db worker name"
  default     = "postgresdb"
}
variable "rds_username" {
  description = "db username"
  default     = "postgres"
}
variable "rds_password" {
  description = "db password"
}
variable "rds_final_snapshot_identifier" {
  description = "db final snapshot identifier"
  default     = "worker-final"
}
variable "app_port" {
  description = "Port exposed by the application"
  default = 3000
}
