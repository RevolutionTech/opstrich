resource "aws_acm_certificate" "static_website" {
  domain_name       = var.domain_name
  validation_method = "DNS"

  tags = var.tags
}

resource "aws_cloudfront_origin_access_identity" "static_website" {
  comment = "OAI for ${var.domain_name}"
}

resource "aws_cloudfront_distribution" "static_website" {
  enabled             = true
  aliases             = [var.domain_name]
  default_root_object = "index.html"
  origin {
    domain_name = aws_s3_bucket.static_website.bucket_regional_domain_name
    origin_id   = var.domain_name
    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.static_website.cloudfront_access_identity_path
    }
  }
  custom_error_response {
    error_code         = 403
    response_code      = 404
    response_page_path = "/${var.error_page}"
  }
  default_cache_behavior {
    allowed_methods        = ["GET", "HEAD"]
    cached_methods         = ["GET", "HEAD"]
    target_origin_id       = aws_s3_bucket.static_website.id
    viewer_protocol_policy = "redirect-to-https"
    cache_policy_id        = "658327ea-f89d-4fab-a63d-7e88639e58f6" # CachingOptimized cache policy
  }
  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }
  viewer_certificate {
    acm_certificate_arn      = aws_acm_certificate.static_website.arn
    ssl_support_method       = "sni-only"
    minimum_protocol_version = "TLSv1.2_2018"
  }

  tags = var.tags
}
