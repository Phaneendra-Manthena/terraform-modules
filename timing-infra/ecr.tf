resource "aws_ecr_repository" "app" {
  name                 = "node-app-backend"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = false
  }
}