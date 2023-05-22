resource "aws_ssm_parameter" "vpc_id" {
  name  = "/timing/vpc/vpc_id"
  type  = "String"
  value = module.vpc.vpc_id
}
resource "aws_ssm_parameter" "private_subnets" {
  name  = "/timing/vpc/private_subnet_ids"
  type  = "StringList"
  value = join(",",local.private_subnet_ids)
}
resource "aws_ssm_parameter" "public_subnets" {
  name  = "/timing/vpc/public_subnet_ids"
  type  = "StringList"
  value = join(",",local.public_subnet_ids)
}

resource "aws_ssm_parameter" "app_alb_security_group_id" {
  name  = "/timing/vpc/app_alb_security_group_id"
  type  = "String"
  value = (local.app_alb_security_group_id)
}
resource "aws_ssm_parameter" "rds_security_group_id" {
  name  = "/timing/vpc/rds_security_group_id"
  type  = "String"
  value = (local.rds_security_group_id)
}
resource "aws_ssm_parameter" "rds_endpoint" {
  name  = "/timing/rds/rds_endpoint"
  type  = "String"
  value = (local.rds_endpoint)
}
resource "aws_ssm_parameter" "app_target_group_arn" {
  name  = "/timing/ec2/app_target_group_arns"
  type  = "StringList"
  value = join(",",[local.app_target_group_arn])
}
resource "aws_ssm_parameter" "rds_secret_srn" {
  name  = "/timing/rds/rds_secret_srn"
  type  = "String"
  value = var.rds_secret_srn
  
}
