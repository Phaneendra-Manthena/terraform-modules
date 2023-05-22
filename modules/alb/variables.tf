variable "app_alb_name" {
    type = string
}
variable "vpc_id" {
    type = string
  
}
variable "private_subnet_ids" {
  type = set(string)
  default = []
}
variable "public_subnet_ids" {
  type = set(string)
  default = []
}
variable "app_alb_security_group_id" {
  type = list(string)
  default = []
}
variable "create_security_group" {
  type = bool
}
variable "alb_name_prefix" {
  type = string
}
variable "alb_backend_protocol" {
  type = string
}
variable "alb_backend_port" {
  type = string
}
variable "alb_target_type" {
  type = string
}
variable "alb_deregistration_delay" {
  type = string
}
variable "alb_interval" {
  type = string
}
variable "alb_healthcheck_path" {
  type = string
}
variable "alb_healthy_threshold" {
  type = string
}
variable "alb_unhealthy_threshold" {
  type = string
}
variable "alb_listner_port" {
  type = string
}
variable "app_alb_tags" {
  type = map
  default = {}
}
variable "tags" {
  type = map
  default = {}
}