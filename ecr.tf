# Create an ECR Repository
resource "aws_ecr_repository" "digitify-application" {

  name                 = "digitify-application"
  image_tag_mutability = "IMMUTABLE"
  image_scanning_configuration {
    scan_on_push = true
  }
  tags = {
    Environment = "Production"
    Project     = "Digitify-App"
  }
}

# Define a policy for the ECR Repository
resource "aws_ecr_repository_policy" "digitify_repo_policy" {

  repository = aws_ecr_repository.digitify-application.name
  policy = jsonencode(
    {
      "Version" : "2008-10-17",
      "Statement" : [
        {
          "Sid" : "AllowSpokeAccountsToPull",
          "Effect" : "Allow",
          "Principal" : "*",
          "Action" : [
            "ecr:GetDownloadUrlForLayer",
            "ecr:BatchGetImage",
            "ecr:BatchCheckLayerAvailability",
            "ecr:CompleteLayerUpload",
            "ecr:GetAuthorizationToken",
            "ecr:UploadLayerPart",
            "ecr:InitiateLayerUpload",
            "ecr:BatchCheckLayerAvailability",
            "ecr:PutImage"
          ]
        }
      ]
    }
  )
}
