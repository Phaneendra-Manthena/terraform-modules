output "vpc_id" {
    value = module.vpc.vpc_id
  
}
output "security_group_id" {
    value = module.rds_sg.security_group_id
  
}
output "db_subnet_group_name" {
    value = module.vpc.db_subnet_group_name
  
}

output "ecs_cluster_id" {
    value = module.ecs_cluster.ecs_cluster_id
  
}

output "alb_security_group_id" {
    value = module.app_alb_sg.security_group_id
  
}

output "private_subnet_ids" {
    value = module.vpc.private_subnet_ids
  
}
output "public_subnet_ids" {
    value = module.vpc.public_subnet_ids
  
}
output "rds_endpoint" {
    value = module.rds.rds_endpoint
  
}
output "app_target_group_arn" {
  value = module.alb.app_target_group_arn
}
output "app_lb_dns_name" {
  value = module.alb.app_lb_dns_name
}
output "lb_zone_id" {
  value = module.alb.lb_zone_id
}