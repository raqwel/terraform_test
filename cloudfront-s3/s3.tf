locals {
  bucket = "cloudfront-s3-test"
}

resource "aws_s3_bucket" "s3_test" {
  bucket = "${local.bucket}"
  acl = "private"
  policy = "${data.template_file.sample_s3_policy.rendered}"
}

data "template_file" "sample_s3_policy" {
  template = "${file("./bucket_policy.tpl")}"

  vars {
    bucket_name            = "${local.bucket}"
    origin_access_identity = "${aws_cloudfront_origin_access_identity.access_identify.id}"
  }
}