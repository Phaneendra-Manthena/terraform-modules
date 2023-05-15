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