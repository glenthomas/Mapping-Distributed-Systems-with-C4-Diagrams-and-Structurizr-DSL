resource "aws_acm_certificate" "website_cert" {
  provider          = aws.us_east_1
  domain_name       = local.domain_name
  validation_method = "DNS"

  subject_alternative_names = [
    "www.${local.domain_name}"
  ]

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name        = local.domain_name
    Environment = "production"
  }
}

resource "aws_acm_certificate_validation" "website_cert_validation" {
  provider                = aws.us_east_1
  certificate_arn         = aws_acm_certificate.website_cert.arn
  validation_record_fqdns = [for record in aws_route53_record.website_cert_validation : record.fqdn]

  timeouts {
    create = "5m"
  }
}
