resource "aws_db_instance" "main" {
     allocated_storage = var.allocated_storage
     db_name = var.db_name
     identifier = var.identifier
     engine = var.engine
    #  engine_version = var.engine_version
     instance_class = var.instance_type
     username = var.rds_username
     db_subnet_group_name = var.db_subnet_group_name
     password = random_password.password.result
     vpc_security_group_ids = var.vpc_security_group_ids
     
     skip_final_snapshot = true
     tags = merge(
        var.tags,
        var.db_instance_tags
     )
}  

# For random password creation
resource "random_password" "password" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

# # Storing the password in secrets manager

# resource "aws_secretsmanager_secret" "rds" {
#   name = var.secret_name
#   tags = merge(
#     var.tags,
#     var.rds_tags
#   )
# }
# We will create secret outside of terraform but we store the value through terraform
data "aws_secretsmanager_secret" "rds_secret" {
  arn = var.rds_secret_srn
}
resource "aws_secretsmanager_secret_version" "rds" {
  secret_id     = data.aws_secretsmanager_secret.rds_secret.id
  secret_string = random_password.password.result
}



