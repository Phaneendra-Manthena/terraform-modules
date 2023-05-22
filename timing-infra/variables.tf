variable "tags" {
  type = map
  default = {
    Name = "timing"
    Environment ="DEV"
    Terraform = "true"
  }
}
variable "vpc_cidr" {
  default = "10.0.0.0/16"
}
variable "azs" {
  default = ["us-east-1a","us-east-1b"]
  
}
variable "public_subnet_cidr" {
  default = ["10.0.1.0/24","10.0.2.0/24"]

}
variable "public_subnet_names" {
  default = ["timing-public-1a","timing-public-1b"]
}

variable "private_subnet_cidr" {
  default = ["10.0.3.0/24","10.0.4.0/24"]
}
variable "private_subnet_names" {
  default = ["timing-private-1a","timing-private-1b"]
}
variable "database_subnet_cidr" {
  default = ["10.0.5.0/24","10.0.6.0/24"]
}
variable "database_subnet_names" {
  default = ["timing-database-1a","timing-database-1b"]
}

variable "rds_security_group_name" {
  default = "timing"
}
variable "rds_security_group_description" {
  default = "This security group is to attach timing rds"
  
}
variable "ingress_cidr" {
default = []
}

variable "allocated_storage" {
    default = "10"
}
variable "db_name" {
  default = "timing"
}
variable "instance_type" {
  default = "db.t2.micro"
}
variable "identifier" {
  default = "timing"
}
variable "engine" {
  default = "mysql"
}
variable "engine_version" {
  default = "8.0.32"
}
variable "rds_username" {
  default = "phani"
}

variable "rds_secret_srn" {
  default = "arn:aws:secretsmanager:us-east-1:347554562486:secret:timing/rds-password-secret-uuixGE"
  
}

variable "ecs_cluster_name" {
  default = "timing"
  }

variable "ecs_log_group_name" {
  default = "/timing/ecs-cluster"
}

variable "app_alb_security_group_name" {
  default = "timing-alb"
}
variable "app_alb_security_group_description" {
  default = "This is used for application ALB"
}
variable "app_alb_ingress_cidr" {
  default = [
    {
      from_port = "80"
      to_port = "80"
      cidr_block = "0.0.0.0/0"
      description = "Opening 80 to internet"
    },
    {
      from_port = "443"
      to_port = "443"
      cidr_block = "0.0.0.0/0"
      description = "Opening 443 to internet"
    }
  ]
}


variable "app_alb_name" {
  default = "timing-app"
}
 
variable "create_security_group" {
  default = "false"
}
variable "alb_name_prefix" {
  default = "timing"
}
variable "alb_backend_protocol" {
  default = "HTTP"
}
variable "alb_backend_port" {
  default = "80"
}
variable "alb_target_type" {
  default = "ip"
}
variable "alb_deregistration_delay" {
  default = "10"
}
variable "alb_interval" {
 default = "30"
}
variable "alb_healthcheck_path" {
  default = "/health"
}
variable "alb_healthy_threshold" {
  default = "3"
}
variable "alb_unhealthy_threshold" {
  default = "3"
}
variable "alb_listner_port" {
  default = "80"
}
variable "app_alb_tags" {
  type = map
  default = {}
}
variable "zone_name" {
  default = "awsphani.tk"
  
}
variable "api_alb_record_name" {
  default = "api"
}
