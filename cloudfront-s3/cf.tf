resource "aws_cloudfront_distribution" "cf_for_s3" {
  "default_cache_behavior" {
    allowed_methods = ["GET", "HEAD"]
    cached_methods = ["GET", "HEAD"]
    "forwarded_values" {
      "cookies" {
        forward = "none"
      }
      query_string = false
    }
    target_origin_id = "${aws_s3_bucket.s3_test.id}"
    viewer_protocol_policy = "redirect-to-https"
    min_ttl = 36000

  }
  enabled = true
  "origin" {
    domain_name = "${aws_s3_bucket.s3_test.bucket_domain_name}"
    origin_id = "${aws_s3_bucket.s3_test.id}"
  }
  "restrictions" {
    "geo_restriction" {
      restriction_type = "none"
    }
  }
  "viewer_certificate" {
    cloudfront_default_certificate = true
  }



}

resource "aws_cloudfront_origin_access_identity" "access_identify" {
  comment = ""
}