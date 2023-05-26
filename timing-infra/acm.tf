module "acm" {
    source  = "terraform-aws-modules/acm/aws"
    version = "~> 4.0"
    domain_name = "*.awsphani.tk"
    zone_id      = "Z0534454KONZUFCW1Q5C"
     subject_alternative_names = [
    "*.awsphani.tk",
    "api.awsphani.tk",
    "web.awsphani.tk",
    "cdn.awsphani.tk",
     ]
    wait_for_validation = true
    tags = var.tags
  
}
# module "acm" {       # Actually this is useful when we create total infra in different region other than us-east-1.Actually we use us-east-1 so we don't need this block.This is to useful to create certificate in different provider.So we mention alias like this
#     source  = "terraform-aws-modules/acm/aws"
#     version = "~> 4.0"
#     domain_name = "*.awsphani.tk"
#     zone_id      = "Z0534454KONZUFCW1Q5C"
#      subject_alternative_names = [
#     "*.awsphani.tk",
#     "api.awsphani.tk",
#     "web.awsphani.tk",
#     "cdn.awsphani.tk",
#      ]
#     wait_for_validation = true
#     tags = var.tags
#   providers = {
#     alias = "ap-south-1-cdn"
#   }
# }