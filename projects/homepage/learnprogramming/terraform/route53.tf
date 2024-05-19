data "aws_route53_zone" "fasterthoughts" {
  name         = "fasterthoughts.io"
}

resource "aws_route53_record" "learnprogramming" {
  zone_id = data.aws_route53_zone.fasterthoughts.zone_id
  name    = "learn.fasterthoughts.io"  # The subdomain you want to create
  type    = "CNAME"
  ttl     = 300

  records = [aws_cloudfront_distribution.this.domain_name]
}