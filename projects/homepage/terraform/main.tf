data "aws_caller_identity" "current" {}
data "aws_region" "current" {}

locals {
  aws_account_id = data.aws_caller_identity.current.account_id
  aws_region = data.aws_region.current.name
  project_name = "learnprogramming"
  domain_name = "learnprogramming.io"
  cloudfront_distribution_arn = "arn:aws:cloudfront::628602948023:distribution/EVF5M3I81ONIU"
  acm_certificate_arn = "arn:aws:acm:us-east-1:628602948023:certificate/1dfbb605-205f-437d-be06-54a5e15e0607"
}