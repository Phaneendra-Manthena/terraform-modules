variable "allocated_storage" {
    type = string
  
}
variable "db_name" {
  type = string
}
variable "identifier" {
  type = string
}
variable "engine" {
  type = string
}
variable "engine_version" {
  type = string
}
variable "instance_type" {
  type = string
}
variable "rds_username" {
  type = string
}
variable "db_subnet_group_name" {
  type = string
}
variable "vpc_security_group_ids" {
  type = list
}
variable "rds_secret_srn" {
    type = string
  
}
variable "tags" {
    type = map
  
}
variable "db_instance_tags" {
    type = map
    default = {}
  
}
