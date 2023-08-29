resource "aws_s3_bucket" "static_website" {
  bucket = var.domain_name

  tags = var.tags
}

resource "aws_s3_bucket_policy" "static_website_read" {
  bucket = var.domain_name
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action   = "s3:GetObject"
        Effect   = "Allow"
        Resource = "${aws_s3_bucket.static_website.arn}/*"
        Principal = {
          AWS = aws_cloudfront_origin_access_identity.static_website.iam_arn
        }
      }
    ]
  })
}

resource "aws_s3_bucket_website_configuration" "static_website" {
  bucket = var.domain_name

  index_document {
    suffix = "index.html"
  }
  error_document {
    key = var.error_page
  }
}
