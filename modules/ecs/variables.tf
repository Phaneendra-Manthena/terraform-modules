variable "ecs_cluster_name" {
    type = string
}
variable "ecs_log_group_name" {
  type = string
}
variable "tags" {
  type = map
}
variable "ecs_cluster_tags" {
  type = map
  default = {}  
}
