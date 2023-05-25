module "acm" {
    source  = "terraform-aws-modules/acm/aws"
    version = "~> 4.0"
    domain_name = "*.awsphani.tk"
    zone_id      = "Z10246641GVSZA608UBVK"
     subject_alternative_names = [
    "*.awsphani.tk",
    "api.awsphani.tk",
    "web.awsphani.tk",
    "cdn.awsphani.tk",
     ]
    wait_for_validation = true
    tags = var.tags
  
}