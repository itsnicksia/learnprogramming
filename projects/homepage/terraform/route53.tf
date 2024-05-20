data "aws_route53_zone" "learnprogramming" {
  name         = "learnprogramming.io"
}

resource "aws_route53_record" "learnprogramming" {
  zone_id = data.aws_route53_zone.learnprogramming.id
  name    = "learnprogramming.io"  # The subdomain you want to create
  type    = "A"

  alias {
    name                   = aws_cloudfront_distribution.this.domain_name
    zone_id                = aws_cloudfront_distribution.this.hosted_zone_id
    evaluate_target_health = false
  }
}