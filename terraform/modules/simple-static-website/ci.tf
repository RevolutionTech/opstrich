locals {
  github_openid_domain   = "token.actions.githubusercontent.com"
  github_openid_audience = "sts.amazonaws.com"
}

# Resource not created by Terraform because the resource is shared by various projects
data "aws_iam_openid_connect_provider" "github" {
  url = "https://${local.github_openid_domain}"
}

resource "aws_iam_role" "ci" {
  name        = "${var.github_repo}-ci"
  description = "IAM role for CI to upload static content for ${var.github_repo}."

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = "sts:AssumeRoleWithWebIdentity"
        Principal = {
          Federated = data.aws_iam_openid_connect_provider.github.arn
        }
        Condition = {
          StringLike = {
            "${local.github_openid_domain}:sub" = "repo:${var.github_org}/${var.github_repo}:*"
          }
          StringEquals = {
            "${local.github_openid_domain}:aud" = local.github_openid_audience
          }
        }
      }
    ]
  })

  tags = var.tags
}

resource "aws_iam_policy" "s3_rw" {
  name        = "${var.github_repo}-s3-rw"
  description = "Policy for full S3 access."
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "s3:*"
        Effect = "Allow"
        Resource = [
          aws_s3_bucket.static_website.arn,
          "${aws_s3_bucket.static_website.arn}/*"
        ]
      }
    ]
  })

  tags = var.tags
}

resource "aws_iam_role_policy_attachment" "ci_s3_rw_attachment" {
  role       = aws_iam_role.ci.name
  policy_arn = aws_iam_policy.s3_rw.arn
}
