provider "aws" {
  region = "us-east-1"
}

# terraform {
#   required_providers {
#     aws = {
#       source = "hashicorp/aws"
#       version = "4.64.0"
#     }
#   }
#   backend "s3" {
#     bucket = "timing-project"
#     region = "us-east-1"    
#   }
# }
# provider "aws" {    # If we to create two providers we use alias
#   region = "ap-south-1"
#   alias = "ap-south-1-cdn"
# }