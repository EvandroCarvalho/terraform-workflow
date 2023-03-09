resource "aws_ecr_repository" "main" {
  name                 = "javaapp-test-ecs"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}