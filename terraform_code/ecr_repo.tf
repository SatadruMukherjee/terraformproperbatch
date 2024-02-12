resource "aws_ecr_repository" "repo_creation_tf" {
  name                 = var.aws_ecr_repo_name
  image_tag_mutability = "MUTABLE"
  force_delete = true
  image_scanning_configuration {
    scan_on_push = true
  }
}

resource "aws_ecr_lifecycle_policy" "ecr_lifecycle_ploicy_tf" {
  repository = aws_ecr_repository.repo_creation_tf.name
  depends_on = [aws_ecr_repository.repo_creation_tf]
  policy = <<EOF
{
  "rules": [
    {
      "rulePriority": 1,
      "description": "Keep last 5 images",
      "selection": {
        "tagStatus": "any",
        "countType": "imageCountMoreThan",
        "countNumber": 5
      },
      "action": {
        "type": "expire"
      }
    }
  ]
}
EOF
}
