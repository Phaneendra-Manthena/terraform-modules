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
    # engine_version = var.engine_version
    instance_type = var.instance_type
    rds_username = var.rds_username
    db_subnet_group_name = local.db_subnet_group_name
    vpc_security_group_ids = [local.rds_security_group_id]
    
    rds_secret_srn = var.rds_secret_srn
    tags = var.tags
    
  }

  module "ecs_cluster" {
    source = "../modules/ecs"
    ecs_cluster_name = var.ecs_cluster_name
    ecs_log_group_name = var.ecs_log_group_name
    tags = var.tags
  }

# We want port no 80 and 443 open to internet
  module "app_alb_sg" {
    source = "../modules/security_group"
    vpc_id = local.vpc_id
    security_group_name = var.app_alb_security_group_name
    security_group_description = var.app_alb_security_group_description
    tags = var.tags
    ingress_cidr = var.app_alb_ingress_cidr
  }


  # module "alb" {
  #   source = "../modules/alb"
  #   vpc_id = local.vpc_id
  #   app_alb_name = var.app_alb_name
  #   # private_subnet_ids = local.private_subnet_ids
  #   public_subnet_ids = local.public_subnet_ids
  #   app_alb_security_group_id = [local.app_alb_security_group_id]
  #   create_security_group = var.create_security_group
  #   alb_name_prefix = var.alb_name_prefix
  #   alb_backend_protocol = var.alb_backend_protocol
  #   alb_backend_port = var.alb_backend_port
  #   alb_target_type = var.alb_target_type
  #   alb_deregistration_delay = var.alb_deregistration_delay
  #   alb_interval = var.alb_interval
  #   alb_healthcheck_path = var.alb_healthcheck_path
  #   alb_healthy_threshold = var.alb_healthy_threshold
  #   alb_unhealthy_threshold = var.alb_unhealthy_threshold
  #   alb_listner_port = var.alb_listner_port
  #   tags = var.tags
  # }
#Route 53    #api.awsphani.tk
module "records" {
  source  = "terraform-aws-modules/route53/aws//modules/records"
  version = "~> 2.0"

  zone_name = var.zone_name

  records = [
    {
      name    = var.api_alb_record_name
      type    = "A"
      alias   = {
        name    = local.api_app_lb_dns_name
        zone_id = local.api_alb_zone_id
      }
    }
  ]
}
  