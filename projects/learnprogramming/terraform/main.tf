data "aws_caller_identity" "current" {}
data "aws_region" "current" {}

locals {
  aws_account_id = data.aws_caller_identity.current.account_id
  aws_region = data.aws_region.current.name
  project_name = "learnprogramming"
  cloudfront_distribution_arn = "arn:aws:cloudfront::628602948023:distribution/EVF5M3I81ONIU"
  acm_certificate_arn = "arn:aws:acm:us-east-1:628602948023:certificate/96152e62-a115-44ef-9142-21f26ca3cdcd"
}

# Doesn't belong here, but it's here for now.
resource "aws_s3_object" "index" {
  bucket = aws_s3_bucket.home_bucket.bucket
  key    = "learnprogramming/index.html"
  source = "assets/index.html"
  content_type = "text/html"
}