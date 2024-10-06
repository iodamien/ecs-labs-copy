resource "aws_ecr_repository" "foo" {
  name                 = "dayum"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = false
  }
}

output "aws_ecr_repository_arn" {
  value = aws_ecr_repository.foo.arn
}

output "aws_ecr_repository_id" {
  value = aws_ecr_repository.foo.registry_id
}

output "aws_ecr_repository_url" {
  value = aws_ecr_repository.foo.repository_url
}