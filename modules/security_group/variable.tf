variable "security_group_name" {
    type = string
  
}
variable "security_group_description" {
    type = string
  
}
variable "security_group_tags" {
    type = map
    default = {}
  
}
variable "vpc_id" {
    type = string
  
}
variable "tags" {
    type = map
  
}
variable "ingress_cidr" {
    type = list(map(string))
    default = []
}
# variable "ingress_cidr" {  # If we to give ports this is process for above ingress_cidr
#     type = list(map(string))
#     default = [
#         {
#             from_port = "80"
#             to_port = "80"
#             cidr_block = "0.0.0.0/0"
#             description = "Enabling to access 80 from internet"
#         },
#         {
#             from_port = "443"
#             to_port = "443"
#             cidr_block = "0.0.0.0/0"
#             description = "Enablint to access 80 from internet"
#         } 
#     ]
  
# }