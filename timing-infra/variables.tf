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
