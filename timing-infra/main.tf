module "vpc" {
 source = "../modules/vpc"
  vpc_cidr = var.vpc_cidr
  tags = var.tags
  # vpc_tags = { "Name" = "phani" }
  public_subnet_cidr = var.public_subnet_cidr
  azs = var.azs
  public_subnet_names = var.public_subnet_names
  public_route_table_name = local.public_route_table_name
  # Private Subnet
  private_subnet_cidr = var.private_subnet_cidr
  private_subnet_names = var.private_subnet_names
  private_route_table_name = local.private_route_table_name
  # Database Subnet
  database_subnet_cidr = var.database_subnet_cidr
  database_subnet_names = var.database_subnet_cidr
  database_route_table_name = local.database_route_table_name
  }

  module "rds_sg" {
    source = "../modules/security_group"
    vpc_id = local.vpc_id
    security_group_name = var.rds_security_group_name
    security_group_description = var.rds_security_group_description
    tags = var.tags
    ingress_cidr = var.ingress_cidr
    
  }

  module "rds" {
    source = "../modules/rds"
    allocated_storage = var.allocated_storage
    db_name = var.db_name
    identifier = var.identifier
    engine = var.engine
    engine_version = var.engine_version
    instance_type = var.instance_type
    rds_username = var.rds_username
    db_subnet_group_name = local.db_subnet_group_name
    vpc_security_group_ids = [local.rds_security_group_id ]
    rds_secret_srn = var.rds_secret_srn
    tags = var.tags
    
  }