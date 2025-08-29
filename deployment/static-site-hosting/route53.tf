locals {
  domain_name = "structurizr-sample.glen-thomas.com"
}

data "aws_route53_zone" "glen_thomas_com" {
  name         = "glen-thomas.com"
}

resource "aws_route53_record" "website_cert_validation" {
  for_each = {
    for dvo in aws_acm_certificate.website_cert.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 60
  type            = each.value.type
  zone_id         = data.aws_route53_zone.glen_thomas_com.zone_id
}

# Route 53 record
resource "aws_route53_record" "website_record" {
  zone_id = data.aws_route53_zone.glen_thomas_com.zone_id
  name    = local.domain_name
  type    = "A"

  alias {
    name                   = aws_cloudfront_distribution.website_distribution.domain_name
    zone_id                = aws_cloudfront_distribution.website_distribution.hosted_zone_id
    evaluate_target_health = false
  }
}
